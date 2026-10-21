import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/admin_page/delivery/model/delivery_model.dart';
import 'package:logistics_website/src/features/admin_page/delivery/view_model/deliveries_viewmodel.dart';
import 'package:logistics_website/src/features/admin_page/quote_request/quote_request.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

// =============================================================================
// BRAND COLORS
// =============================================================================

class BrandColors {
  static const Color primary = Color(0xFFFF4800);
  static const Color primaryLight = Color(0xFFFF6B35);
  static const Color primaryDark = Color(0xFFCC3A00);
  static const Color primaryBg = Color(0xFFFFF0EB);
  static const Color secondary = Color(0xFF1A1A2E);
  static const Color surface = Color(0xFFF5F7FB);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFDC2626);
  static const Color info = Color(0xFF2563EB);
}

// =============================================================================
// RESPONSIVE CONFIGURATION
// =============================================================================

class ResponsiveConfig {
  static const double mobileBreakpoint = 700;
  static const double tabletBreakpoint = 1100;
  static const double desktopBreakpoint = 1400;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopBreakpoint;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static EdgeInsets getPadding(BuildContext context) {
    final width = getWidth(context);
    if (isMobile(context)) return const EdgeInsets.all(16);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(32);
  }

  static double getCardSpacing(BuildContext context) {
    if (isMobile(context)) return 12;
    if (isTablet(context)) return 16;
    return 20;
  }

  static int getStatColumns(BuildContext context) {
    final width = getWidth(context);
    if (width < 500) return 2;
    if (width < 900) return 2;
    if (width < 1200) return 4;
    return 4;
  }
}

// =============================================================================
// MAIN DASHBOARD PAGE
// =============================================================================

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  ConsumerState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage>
    with TickerProviderStateMixin {
  late final RealtimeChannel _channel;
  late final AnimationController _pulseController;
  late final AnimationController _routeController;
  late final AnimationController _fadeController;

  final TextEditingController _searchController = TextEditingController();

  String _selectedStatus = 'All';
  String _selectedMenu = 'Dashboard';
  bool _sidebarExpanded = true;
  bool _isSearchFocused = false;

  final List<String> _statuses = const [
    'All',
    'Pending',
    'Dispatched',
    'In-Transit',
    'Out for Delivery',
    'Delivered',
    'Cancelled',
  ];

  final Map<String, IconData> _menuIcons = {
    'Dashboard': Icons.dashboard_rounded,
    'Deliveries': Icons.local_shipping_rounded,
     'Quote Requests': Icons.request_quote_outlined,
    'Analytics': Icons.analytics_rounded,
    'Settings': Icons.settings_rounded,
  };

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deliveryProvider.notifier).fetchDeliveries();
    });

    _channel = Supabase.instance.client
        .channel('public:deliveries')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'deliveries',
          callback: (_) {
            if (mounted) {
              ref.read(deliveryProvider.notifier).fetchDeliveries();
            }
          },
        )
        .subscribe();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _routeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _channel.unsubscribe();
    _pulseController.dispose();
    _routeController.dispose();
    _fadeController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<DeliveryModel> _filterDeliveries(List<DeliveryModel> deliveries) {
    final query = _searchController.text.trim().toLowerCase();

    return deliveries.where((delivery) {
      final matchesStatus = _selectedStatus == 'All' ||
          delivery.status.toLowerCase() == _selectedStatus.toLowerCase();

      final matchesSearch = query.isEmpty ||
          delivery.sender_name.toLowerCase().contains(query) ||
          delivery.receiver_name.toLowerCase().contains(query) ||
          delivery.tracking_number.toLowerCase().contains(query) ||
          delivery.destination.toLowerCase().contains(query) ||
          delivery.status.toLowerCase().contains(query);

      return matchesStatus && matchesSearch;
    }).toList();
  }

  int _countStatus(List<DeliveryModel> deliveries, String status) {
    return deliveries
        .where(
          (delivery) =>
              delivery.status.toLowerCase() == status.toLowerCase(),
        )
        .length;
  }

  @override
  Widget build(BuildContext context) {
    final asyncDeliveries = ref.watch(deliveryProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF08111F)
          : BrandColors.surface,
      body: AnimatedBuilder(
        animation: _fadeController,
        builder: (context, child) {
          return FadeTransition(
            opacity: _fadeController,
            child: asyncDeliveries.when(
              loading: () => const _DashboardLoading(),
              error: (error, stackTrace) => _DashboardError(
                error: error,
                onRetry: () {
                  ref.read(deliveryProvider.notifier).fetchDeliveries();
                },
              ),
              data: (deliveries) {
                final filteredDeliveries = _filterDeliveries(deliveries);

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;

                    if (ResponsiveConfig.isMobile(context)) {
                      return _buildMobileLayout(
                        context,
                        deliveries,
                        filteredDeliveries,
                      );
                    }

                    if (ResponsiveConfig.isTablet(context)) {
                      return _buildTabletLayout(
                        context,
                        deliveries,
                        filteredDeliveries,
                      );
                    }

                    return _buildDesktopLayout(
                      context,
                      deliveries,
                      filteredDeliveries,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }

  // ===========================================================================
  // DESKTOP LAYOUT
  // ===========================================================================

  Widget _buildDesktopLayout(
    BuildContext context,
    List<DeliveryModel> deliveries,
    List<DeliveryModel> filteredDeliveries,
  ) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: _sidebarExpanded ? 260 : 80,
          child: _Sidebar(
            expanded: _sidebarExpanded,
            selectedMenu: _selectedMenu,
            onToggle: () {
              setState(() {
                _sidebarExpanded = !_sidebarExpanded;
              });
            },
            onSelected: (value) {
              setState(() {
                _selectedMenu = value;
              });
            },
          ),
        ),
        Expanded(
          child: _DashboardBackground(
            pulse: _pulseController,
            route: _routeController,
            child: SafeArea(
              child: _buildMainContent(
                context,
                deliveries,
                filteredDeliveries,
                desktop: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // TABLET LAYOUT
  // ===========================================================================

  Widget _buildTabletLayout(
    BuildContext context,
    List<DeliveryModel> deliveries,
    List<DeliveryModel> filteredDeliveries,
  ) {
    return _DashboardBackground(
      pulse: _pulseController,
      route: _routeController,
      child: SafeArea(
        child: Column(
          children: [
            _TabletHeader(
              onMenuPressed: () {
                _showMobileMenu(context);
              },
            ),
            Expanded(
              child: _buildMainContent(
                context,
                deliveries,
                filteredDeliveries,
                desktop: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // MOBILE LAYOUT
  // ===========================================================================

  Widget _buildMobileLayout(
    BuildContext context,
    List<DeliveryModel> deliveries,
    List<DeliveryModel> filteredDeliveries,
  ) {
    return _DashboardBackground(
      pulse: _pulseController,
      route: _routeController,
      child: SafeArea(
        child: Column(
          children: [
            _MobileHeader(
              onMenuPressed: () {
                _showMobileMenu(context);
              },
            ),
            Expanded(
              child: _buildMainContent(
                context,
                deliveries,
                filteredDeliveries,
                desktop: false,
                mobile: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ===========================================================================
  // MAIN CONTENT
  // ===========================================================================

  Widget _buildMainContent(
    BuildContext context,
    List<DeliveryModel> deliveries,
    List<DeliveryModel> filteredDeliveries, {
    bool desktop = false,
    bool mobile = false,
  }) {
    if (_selectedMenu == 'Quote Requests') {
  return const QuoteRequestsPage();
}
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(deliveryProvider.notifier).fetchDeliveries();
      },
      color: BrandColors.primary,
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          SliverPadding(
            padding: EdgeInsets.fromLTRB(
              mobile ? 16 : 28,
              desktop ? 28 : 16,
              mobile ? 16 : 28,
              30,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildWelcomeHeader(context, mobile),
                  const SizedBox(height: 24),
                  _buildStats(context, deliveries, mobile: mobile),
                  const SizedBox(height: 28),
                  _buildDeliverySectionHeader(
                    context,
                    filteredDeliveries.length,
                    mobile: mobile,
                  ),
                  const SizedBox(height: 16),
                  _buildToolbar(context, mobile: mobile),
                  const SizedBox(height: 18),
                  if (filteredDeliveries.isEmpty)
                    _EmptyDeliveries(
                      hasFilter: _searchController.text.isNotEmpty ||
                          _selectedStatus != 'All',
                      onClear: _clearFilters,
                    )
                  else if (mobile)
                    _MobileDeliveryList(
                      deliveries: filteredDeliveries,
                      onEdit: _showEditStatusDialog,
                      onDelete: _confirmDelete,
                    )
                  else if (desktop)
                    _DesktopDeliveryTable(
                      deliveries: filteredDeliveries,
                      onEdit: _showEditStatusDialog,
                      onDelete: _confirmDelete,
                    )
                  else
                    _TabletDeliveryList(
                      deliveries: filteredDeliveries,
                      onEdit: _showEditStatusDialog,
                      onDelete: _confirmDelete,
                    ),
                  const SizedBox(height: 30),
                  _buildFooter(context, isDark),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // WELCOME HEADER
  // ===========================================================================

  Widget _buildWelcomeHeader(BuildContext context, bool mobile) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good day 👋',
                style: GoogleFonts.poppins(
                  fontSize: mobile ? 13 : 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: .55),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Logistics Dashboard',
                style: GoogleFonts.poppins(
                  fontSize: mobile ? 25 : 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.8,
                  color: isDark ? Colors.white : BrandColors.secondary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                mobile
                    ? 'Monitor your deliveries in real time.'
                    : 'Monitor deliveries, track shipments and manage your logistics operations.',
                style: GoogleFonts.poppins(
                  fontSize: mobile ? 12 : 14,
                  color: theme.colorScheme.onSurface.withValues(alpha: .55),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        if (!mobile) ...[
          const SizedBox(width: 20),
          const _LiveIndicator(),
        ],
      ],
    );
  }

  // ===========================================================================
  // STATS GRID
  // ===========================================================================

  Widget _buildStats(
    BuildContext context,
    List<DeliveryModel> deliveries, {
    required bool mobile,
  }) {
    final stats = [
      _StatData(
        title: 'Total Deliveries',
        value: deliveries.length.toString(),
        icon: Icons.inventory_2_outlined,
        accent: BrandColors.primary,
        trend: '+12%',
        trendUp: true,
      ),
      _StatData(
        title: 'Pending',
        value: _countStatus(deliveries, 'Pending').toString(),
        icon: Icons.schedule_rounded,
        accent: BrandColors.warning,
        trend: '+5%',
        trendUp: true,
      ),
      _StatData(
        title: 'In Transit',
        value: _countStatus(deliveries, 'In-Transit').toString(),
        icon: Icons.local_shipping_outlined,
        accent: BrandColors.info,
        trend: '-2%',
        trendUp: false,
      ),
      _StatData(
        title: 'Delivered',
        value: _countStatus(deliveries, 'Delivered').toString(),
        icon: Icons.check_circle_outline_rounded,
        accent: BrandColors.success,
        trend: '+8%',
        trendUp: true,
      ),
    ];

    final columns = ResponsiveConfig.getStatColumns(context);

    if (mobile) {
      return SizedBox(
        height: 130,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: stats.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 180,
              child: _StatCard(data: stats[index]),
            );
          },
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stats.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: ResponsiveConfig.getCardSpacing(context),
        mainAxisSpacing: ResponsiveConfig.getCardSpacing(context),
        childAspectRatio: columns == 4 ? 2.0 : 2.4,
      ),
      itemBuilder: (context, index) {
        return _StatCard(data: stats[index]);
      },
    );
  }

  // ===========================================================================
  // DELIVERY SECTION HEADER
  // ===========================================================================

  Widget _buildDeliverySectionHeader(
    BuildContext context,
    int count, {
    required bool mobile,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Text(
            'Recent Deliveries',
            style: GoogleFonts.poppins(
              fontSize: mobile ? 18 : 21,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: BrandColors.primary.withValues(alpha: .08),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            '$count ${count == 1 ? 'result' : 'results'}',
            style: GoogleFonts.poppins(
              color: BrandColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // TOOLBAR
  // ===========================================================================

  Widget _buildToolbar(
    BuildContext context, {
    required bool mobile,
  }) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (mobile) {
      return Column(
        children: [
          _SearchField(
            controller: _searchController,
            onClear: _searchController.text.isEmpty
                ? null
                : () {
                    _searchController.clear();
                  },
            onFocusChanged: (focused) {
              setState(() {
                _isSearchFocused = focused;
              });
            },
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: _FilterButton(
                  status: _selectedStatus,
                  statuses: _statuses,
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              _IconToolbarButton(
                icon: Icons.refresh_rounded,
                tooltip: 'Refresh',
                onPressed: () {
                  ref.read(deliveryProvider.notifier).fetchDeliveries();
                },
              ),
            ],
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101B2B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .07)
              : const Color(0xFFE8ECF2),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: isDark ? 0.1 : 0.03),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _SearchField(
              controller: _searchController,
              onClear: _searchController.text.isEmpty
                  ? null
                  : () {
                      _searchController.clear();
                    },
              onFocusChanged: (focused) {
                setState(() {
                  _isSearchFocused = focused;
                });
              },
            ),
          ),
          const SizedBox(width: 10),
          _FilterButton(
            status: _selectedStatus,
            statuses: _statuses,
            onChanged: (value) {
              setState(() {
                _selectedStatus = value;
              });
            },
          ),
          const SizedBox(width: 10),
          _IconToolbarButton(
            icon: Icons.refresh_rounded,
            tooltip: 'Refresh deliveries',
            onPressed: () {
              ref.read(deliveryProvider.notifier).fetchDeliveries();
            },
          ),
          const SizedBox(width: 10),
          _IconToolbarButton(
            icon: Icons.download_rounded,
            tooltip: 'Export data',
            onPressed: () {
              _showExportOptions(context);
            },
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // FOOTER
  // ===========================================================================

  Widget _buildFooter(BuildContext context, bool isDark) {
    return Center(
      child: Text(
        'Live delivery management • Powered by Supabase',
        style: GoogleFonts.poppins(
          fontSize: 11,
          color: Theme.of(context)
              .colorScheme
              .onSurface
              .withValues(alpha: .35),
        ),
      ),
    );
  }

  // ===========================================================================
  // DIALOGS & ACTIONS
  // ===========================================================================

  void _showEditStatusDialog(
    BuildContext context,
    DeliveryModel delivery,
  ) {
    String selectedStatus = delivery.status;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            final isDark = Theme.of(context).brightness == Brightness.dark;

            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              backgroundColor: isDark ? const Color(0xFF0B1728) : Colors.white,
              title: Row(
                children: [
                  Icon(
                    Icons.edit_rounded,
                    color: BrandColors.primary,
                    size: 28,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Update Status',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      color: isDark ? Colors.white : BrandColors.secondary,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: 420,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: BrandColors.primary.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        delivery.tracking_number,
                        style: GoogleFonts.poppins(
                          color: BrandColors.primary,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Select new status',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : BrandColors.secondary,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      initialValue: selectedStatus,
                      dropdownColor: isDark ? const Color(0xFF0B1728) : Colors.white,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                      items: _statuses
                          .where((status) => status != 'All')
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Row(
                                children: [
                                  Icon(
                                    _getStatusIcon(status),
                                    size: 16,
                                    color: _getStatusColor(status),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(status),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value == null) return;

                        setDialogState(() {
                          selectedStatus = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _StatusTimeline(currentStatus: delivery.status),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.poppins(
                      color: isDark ? Colors.white70 : BrandColors.secondary,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    Navigator.pop(dialogContext);
                    await _updateDeliveryStatus(delivery, selectedStatus);
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: BrandColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Save Changes'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _StatusTimeline({required String currentStatus}) {
    final statuses = ['Pending', 'Dispatched', 'In-Transit', 'Out for Delivery', 'Delivered'];
    final currentIndex = statuses.indexOf(currentStatus);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Progress',
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white70 : BrandColors.secondary,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: statuses.asMap().entries.map((entry) {
            final index = entry.key;
            final status = entry.value;
            final isActive = index <= currentIndex;

            return Expanded(
              child: Column(
                children: [
                  Container(
                    height: 4,
                    decoration: BoxDecoration(
                      color: isActive
                          ? BrandColors.primary
                          : Colors.grey.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    status.split('-').first,
                    style: GoogleFonts.poppins(
                      fontSize: 8,
                      color: isActive
                          ? BrandColors.primary
                          : Colors.grey.withValues(alpha: 0.5),
                      fontWeight: isActive ? FontWeight.w700 : FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Future<void> _updateDeliveryStatus(
    DeliveryModel delivery,
    String status,
  ) async {
    try {
      await ref
          .read(deliveryProvider.notifier)
          .updateDelivery(delivery.tracking_number, {'status': status});

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.check_circle_outline_rounded, color: Colors.green),
              const SizedBox(width: 12),
              Text(
                'Delivery status updated successfully',
                style: GoogleFonts.poppins(),
              ),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.green.shade50,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.green.withValues(alpha: .2)),
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline_rounded, color: Colors.red),
              const SizedBox(width: 12),
              Text('Unable to update status: $e'),
            ],
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red.shade50,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.red.withValues(alpha: .2)),
          ),
        ),
      );
    }
  }

  void _confirmDelete(
    BuildContext context,
    String trackingNumber,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          backgroundColor: isDark ? const Color(0xFF0B1728) : Colors.white,
          title: Row(
            children: [
              const Icon(
                Icons.warning_rounded,
                color: Colors.red,
                size: 28,
              ),
              const SizedBox(width: 12),
              Text(
                'Delete Delivery?',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : BrandColors.secondary,
                ),
              ),
            ],
          ),
          content: Text(
            'Are you sure you want to permanently delete delivery '
            '$trackingNumber? This action cannot be undone.',
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white70 : BrandColors.secondary,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  color: isDark ? Colors.white70 : BrandColors.secondary,
                ),
              ),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                Navigator.pop(dialogContext);

                final success = await ref
                    .read(deliveryProvider.notifier)
                    .deleteDelivery(trackingNumber);

                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      success
                          ? 'Delivery deleted successfully'
                          : 'Failed to delete delivery',
                      style: GoogleFonts.poppins(),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor:
                        success ? Colors.green.shade50 : Colors.red.shade50,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: (success ? Colors.green : Colors.red)
                            .withValues(alpha: .2),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Delete Permanently'),
            ),
          ],
        );
      },
    );
  }

  void _showExportOptions(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: isDark ? const Color(0xFF0B1728) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Export Data',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
                const SizedBox(height: 16),
                _ExportOption(
                  icon: Icons.picture_as_pdf_rounded,
                  title: 'Export as PDF',
                  subtitle: 'Download report as PDF',
                  onTap: () {
                    Navigator.pop(context);
                    _showExportSuccess(context, 'PDF');
                  },
                ),
                _ExportOption(
                  icon: Icons.table_chart_rounded,
                  title: 'Export as CSV',
                  subtitle: 'Download data as CSV',
                  onTap: () {
                    Navigator.pop(context);
                    _showExportSuccess(context, 'CSV');
                  },
                ),
                _ExportOption(
                  icon: Icons.file_copy_rounded,
                  title: 'Export as Excel',
                  subtitle: 'Download data as Excel file',
                  onTap: () {
                    Navigator.pop(context);
                    _showExportSuccess(context, 'Excel');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showExportSuccess(BuildContext context, String format) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Exporting data as $format...',
          style: GoogleFonts.poppins(),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: BrandColors.primary,
        duration: const Duration(seconds: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _searchController.clear();
      _selectedStatus = 'All';
    });
  }

  void _showMobileMenu(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      backgroundColor: isDark ? const Color(0xFF0B1728) : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8),
                  child: Text(
                    'Menu',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: isDark ? Colors.white70 : BrandColors.secondary,
                    ),
                  ),
                ),
                ..._menuIcons.keys.map(
                  (key) => _MobileMenuItem(
                    icon: _menuIcons[key]!,
                    title: key,
                    selected: _selectedMenu == key,
                    onTap: () {
                      Navigator.pop(context);
                      setState(() => _selectedMenu = key);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pending':
        return BrandColors.warning;
      case 'Dispatched':
        return BrandColors.primary;
      case 'In-Transit':
        return BrandColors.info;
      case 'Out for Delivery':
        return const Color(0xFF9333EA);
      case 'Delivered':
        return BrandColors.success;
      case 'Cancelled':
        return BrandColors.error;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'Pending':
        return Icons.schedule_rounded;
      case 'Dispatched':
        return Icons.local_shipping_outlined;
      case 'In-Transit':
        return Icons.route_rounded;
      case 'Out for Delivery':
        return Icons.delivery_dining_rounded;
      case 'Delivered':
        return Icons.check_circle_outline_rounded;
      case 'Cancelled':
        return Icons.cancel_outlined;
      default:
        return Icons.help_outline_rounded;
    }
  }
}

// =============================================================================
// SIDEBAR
// =============================================================================

class _Sidebar extends StatelessWidget {
  final bool expanded;
  final String selectedMenu;
  final VoidCallback onToggle;
  final ValueChanged<String> onSelected;

  const _Sidebar({
    required this.expanded,
    required this.selectedMenu,
    required this.onToggle,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0B1625) : Colors.white,
        border: Border(
          right: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: .06)
                : const Color(0xFFE7EBF0),
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: expanded ? 20 : 16,
              vertical: 24,
            ),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [BrandColors.primary, BrandColors.primaryLight],
                    ),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: const Icon(
                    Icons.local_shipping_rounded,
                    color: Colors.white,
                  ),
                ),
                if (expanded) ...[
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'LogiTrack',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                _SidebarItem(
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  expanded: expanded,
                  selected: selectedMenu == 'Dashboard',
                  onTap: () => onSelected('Dashboard'),
                ),
                _SidebarItem(
                  icon: Icons.local_shipping_outlined,
                  label: 'Deliveries',
                  expanded: expanded,
                  selected: selectedMenu == 'Deliveries',
                  onTap: () => onSelected('Deliveries'),
                ),
                _SidebarItem(
  icon: Icons.request_quote_outlined,
  label: 'Quote Requests',
  expanded: expanded,
  selected: selectedMenu == 'Quote Requests',
  onTap: () => onSelected('Quote Requests'),
),
                _SidebarItem(
                  icon: Icons.analytics_outlined,
                  label: 'Analytics',
                  expanded: expanded,
                  selected: selectedMenu == 'Analytics',
                  onTap: () => onSelected('Analytics'),
                ),
                const SizedBox(height: 20),
                if (expanded)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 10),
                    child: Text(
                      'SYSTEM',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface
                            .withValues(alpha: .35),
                      ),
                    ),
                  ),
                _SidebarItem(
                  icon: Icons.settings_outlined,
                  label: 'Settings',
                  expanded: expanded,
                  selected: selectedMenu == 'Settings',
                  onTap: () => onSelected('Settings'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              onPressed: onToggle,
              tooltip: expanded ? 'Collapse sidebar' : 'Expand sidebar',
              icon: AnimatedRotation(
                duration: const Duration(milliseconds: 300),
                turns: expanded ? 0.0 : 0.5,
                child: Icon(
                  expanded
                      ? Icons.chevron_left_rounded
                      : Icons.chevron_right_rounded,
                  size: 24,
                  color: BrandColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool expanded;
  final bool selected;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.expanded,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Tooltip(
      message: expanded ? '' : label,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          margin: const EdgeInsets.symmetric(vertical: 3),
          padding: EdgeInsets.symmetric(
            horizontal: expanded ? 14 : 16,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: selected
                ? BrandColors.primary.withValues(alpha: .10)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Row(
            mainAxisAlignment: expanded
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: selected
                    ? BrandColors.primary
                    : theme.colorScheme.onSurface.withValues(alpha: .55),
              ),
              if (expanded) ...[
                const SizedBox(width: 13),
                Expanded(
                  child: Text(
                    label,
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      fontWeight:
                          selected ? FontWeight.w700 : FontWeight.w500,
                      color: selected
                          ? BrandColors.primary
                          : theme.colorScheme.onSurface.withValues(alpha: .65),
                    ),
                  ),
                ),
                if (selected)
                  Icon(
                    Icons.check_rounded,
                    size: 16,
                    color: BrandColors.primary,
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// STAT CARD
// =============================================================================

class _StatData {
  final String title;
  final String value;
  final IconData icon;
  final Color accent;
  final String? trend;
  final bool? trendUp;

  const _StatData({
    required this.title,
    required this.value,
    required this.icon,
    required this.accent,
    this.trend,
    this.trendUp,
  });
}

class _StatCard extends StatelessWidget {
  final _StatData data;

  const _StatCard({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101B2B) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .06)
              : const Color(0xFFE7EBF0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 7),
            color: Colors.black.withValues(
              alpha: isDark ? .10 : .035,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: data.accent.withValues(alpha: .10),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              data.icon,
              color: data.accent,
              size: 22,
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data.title,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: theme.colorScheme.onSurface.withValues(alpha: .50),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      data.value,
                      style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                        color: isDark ? Colors.white : BrandColors.secondary,
                      ),
                    ),
                    if (data.trend != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: (data.trendUp ?? true)
                              ? Colors.green.withValues(alpha: .12)
                              : Colors.red.withValues(alpha: .12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              data.trendUp ?? true
                                  ? Icons.trending_up_rounded
                                  : Icons.trending_down_rounded,
                              size: 12,
                              color: (data.trendUp ?? true)
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              data.trend!,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: (data.trendUp ?? true)
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// DESKTOP TABLE
// =============================================================================

class _DesktopDeliveryTable extends StatelessWidget {
  final List<DeliveryModel> deliveries;
  final void Function(BuildContext, DeliveryModel) onEdit;
  final void Function(BuildContext, String) onDelete;

  const _DesktopDeliveryTable({
    required this.deliveries,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101B2B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .06)
              : const Color(0xFFE7EBF0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 25,
            offset: const Offset(0, 8),
            color: Colors.black.withValues(alpha: .035),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            horizontalMargin: 20,
            columnSpacing: 34,
            headingRowHeight: 58,
            dataRowMinHeight: 70,
            dataRowMaxHeight: 78,
            headingTextStyle: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: theme.colorScheme.onSurface.withValues(alpha: .48),
            ),
            headingRowColor: WidgetStatePropertyAll(
              isDark
                  ? Colors.white.withValues(alpha: .025)
                  : const Color(0xFFF8FAFC),
            ),
            columns: const [
              DataColumn(label: Text('SHIPMENT')),
              DataColumn(label: Text('SENDER')),
              DataColumn(label: Text('RECEIVER')),
              DataColumn(label: Text('STATUS')),
              DataColumn(label: Text('DESTINATION')),
              DataColumn(label: Text('ACTIONS')),
            ],
            rows: deliveries.map((delivery) {
              return DataRow(
                cells: [
                  DataCell(
                    _TrackingCell(
                      trackingNumber: delivery.tracking_number,
                    ),
                  ),
                  DataCell(
                    Text(
                      delivery.sender_name,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(delivery.receiver_name),
                  ),
                  DataCell(
                    _StatusBadge(status: delivery.status),
                  ),
                  DataCell(
                    _DestinationCell(
                      destination: delivery.destination,
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          tooltip: 'Edit status',
                          onPressed: () => onEdit(context, delivery),
                          icon: const Icon(
                            Icons.edit_outlined,
                            size: 19,
                            color: BrandColors.primary,
                          ),
                        ),
                        IconButton(
                          tooltip: 'Delete delivery',
                          onPressed: () => onDelete(
                            context,
                            delivery.tracking_number,
                          ),
                          icon: const Icon(
                            Icons.delete_outline_rounded,
                            size: 19,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// TABLET DELIVERY LIST
// =============================================================================

class _TabletDeliveryList extends StatelessWidget {
  final List<DeliveryModel> deliveries;
  final void Function(BuildContext, DeliveryModel) onEdit;
  final void Function(BuildContext, String) onDelete;

  const _TabletDeliveryList({
    required this.deliveries,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: deliveries
          .map(
            (delivery) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _DeliveryCard(
                delivery: delivery,
                compact: true,
                onEdit: () => onEdit(context, delivery),
                onDelete: () =>
                    onDelete(context, delivery.tracking_number),
              ),
            ),
          )
          .toList(),
    );
  }
}

// =============================================================================
// MOBILE DELIVERY LIST
// =============================================================================

class _MobileDeliveryList extends StatelessWidget {
  final List<DeliveryModel> deliveries;
  final void Function(BuildContext, DeliveryModel) onEdit;
  final void Function(BuildContext, String) onDelete;

  const _MobileDeliveryList({
    required this.deliveries,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: deliveries
          .map(
            (delivery) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _DeliveryCard(
                delivery: delivery,
                onEdit: () => onEdit(context, delivery),
                onDelete: () =>
                    onDelete(context, delivery.tracking_number),
              ),
            ),
          )
          .toList(),
    );
  }
}

// =============================================================================
// DELIVERY CARD
// =============================================================================

class _DeliveryCard extends StatelessWidget {
  final DeliveryModel delivery;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final bool compact;

  const _DeliveryCard({
    required this.delivery,
    required this.onEdit,
    required this.onDelete,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.all(compact ? 17 : 16),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101B2B) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .06)
              : const Color(0xFFE7EBF0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 18,
            offset: const Offset(0, 5),
            color: Colors.black.withValues(alpha: .035),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _TrackingCell(
                  trackingNumber: delivery.tracking_number,
                ),
              ),
              _StatusBadge(status: delivery.status),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: _PersonInfo(
                  icon: Icons.person_outline_rounded,
                  label: 'Sender',
                  value: delivery.sender_name,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _PersonInfo(
                  icon: Icons.person_rounded,
                  label: 'Receiver',
                  value: delivery.receiver_name,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _DestinationCell(
            destination: delivery.destination,
            fullWidth: true,
          ),
          const SizedBox(height: 16),
          Divider(
            height: 1,
            color: isDark
                ? Colors.white.withValues(alpha: .06)
                : const Color(0xFFE9EDF2),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextButton.icon(
                  onPressed: onEdit,
                  icon: const Icon(
                    Icons.edit_outlined,
                    size: 17,
                    color: BrandColors.primary,
                  ),
                  label: Text(
                    'Edit Status',
                    style: GoogleFonts.poppins(
                      color: BrandColors.primary,
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 25,
                color: isDark
                    ? Colors.white.withValues(alpha: .08)
                    : const Color(0xFFE9EDF2),
              ),
              Expanded(
                child: TextButton.icon(
                  onPressed: onDelete,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                  ),
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    size: 17,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Delete',
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =============================================================================
// SMALL COMPONENTS
// =============================================================================

class _TrackingCell extends StatelessWidget {
  final String trackingNumber;

  const _TrackingCell({
    required this.trackingNumber,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: BrandColors.primary.withValues(alpha: .09),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.qr_code_2_rounded,
            size: 18,
            color: BrandColors.primary,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          trackingNumber,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: BrandColors.primary,
          ),
        ),
      ],
    );
  }
}

class _DestinationCell extends StatelessWidget {
  final String destination;
  final bool fullWidth;

  const _DestinationCell({
    required this.destination,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Row(
      mainAxisSize: fullWidth ? MainAxisSize.max : MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 17,
          color: theme.colorScheme.onSurface.withValues(alpha: .45),
        ),
        const SizedBox(width: 7),
        Flexible(
          child: Text(
            destination,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: theme.colorScheme.onSurface.withValues(alpha: .70),
            ),
          ),
        ),
      ],
    );

    return content;
  }
}

class _PersonInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PersonInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: theme.colorScheme.onSurface.withValues(alpha: .42),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: theme.colorScheme.onSurface.withValues(alpha: .42),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;

  const _StatusBadge({
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final config = _statusConfig(status);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? config.foreground.withValues(alpha: .15)
            : config.background,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isDark
              ? config.foreground.withValues(alpha: .2)
              : Colors.transparent,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            config.icon,
            size: 14,
            color: isDark ? config.foreground : config.foreground,
          ),
          const SizedBox(width: 5),
          Text(
            status,
            style: GoogleFonts.poppins(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: isDark ? config.foreground : config.foreground,
            ),
          ),
        ],
      ),
    );
  }
}

_StatusConfig _statusConfig(String status) {
  switch (status) {
    case 'Pending':
      return const _StatusConfig(
        icon: Icons.schedule_rounded,
        foreground: BrandColors.warning,
        background: Color(0xFFFFF7E6),
      );
    case 'Dispatched':
      return const _StatusConfig(
        icon: Icons.local_shipping_outlined,
        foreground: BrandColors.primary,
        background: Color(0xFFFEF0EB),
      );
    case 'In-Transit':
      return const _StatusConfig(
        icon: Icons.route_rounded,
        foreground: BrandColors.info,
        background: Color(0xFFEFF6FF),
      );
    case 'Out for Delivery':
      return const _StatusConfig(
        icon: Icons.delivery_dining_rounded,
        foreground: Color(0xFF9333EA),
        background: Color(0xFFF5F3FF),
      );
    case 'Delivered':
      return const _StatusConfig(
        icon: Icons.check_circle_outline_rounded,
        foreground: BrandColors.success,
        background: Color(0xFFECFDF3),
      );
    case 'Cancelled':
      return const _StatusConfig(
        icon: Icons.cancel_outlined,
        foreground: BrandColors.error,
        background: Color(0xFFFFF1F2),
      );
    default:
      return const _StatusConfig(
        icon: Icons.help_outline_rounded,
        foreground: Color(0xFF6B7280),
        background: Color(0xFFF3F4F6),
      );
  }
}

class _StatusConfig {
  final IconData icon;
  final Color foreground;
  final Color background;

  const _StatusConfig({
    required this.icon,
    required this.foreground,
    required this.background,
  });
}

// =============================================================================
// SEARCH / FILTER
// =============================================================================

class _SearchField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onClear;
  final ValueChanged<bool>? onFocusChanged;

  const _SearchField({
    required this.controller,
    this.onClear,
    this.onFocusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: .04)
            : const Color(0xFFF7F8FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .06)
              : Colors.transparent,
        ),
      ),
      child: TextField(
        controller: controller,
        onTap: () {
          if (onFocusChanged != null) onFocusChanged!(true);
        },
        onSubmitted: (_) {
          if (onFocusChanged != null) onFocusChanged!(false);
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search deliveries...',
          hintStyle: GoogleFonts.poppins(
            fontSize: 12,
            color: theme.colorScheme.onSurface.withValues(alpha: .38),
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 19,
            color: theme.colorScheme.onSurface.withValues(alpha: .45),
          ),
          suffixIcon: onClear == null
              ? null
              : IconButton(
                  onPressed: onClear,
                  icon: const Icon(
                    Icons.close_rounded,
                    size: 17,
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
        ),
      ),
    );
  }
}

class _FilterButton extends StatelessWidget {
  final String status;
  final List<String> statuses;
  final ValueChanged<String> onChanged;

  const _FilterButton({
    required this.status,
    required this.statuses,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return PopupMenuButton<String>(
      tooltip: 'Filter status',
      onSelected: onChanged,
      position: PopupMenuPosition.under,
      offset: const Offset(0, 8),
      itemBuilder: (context) {
        return statuses
            .map(
              (value) => PopupMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    if (value == status)
                      Icon(
                        Icons.check_rounded,
                        size: 17,
                        color: BrandColors.primary,
                      )
                    else
                      const SizedBox(width: 17),
                    const SizedBox(width: 8),
                    Text(value),
                  ],
                ),
              ),
            )
            .toList();
      },
      child: Container(
        height: 44,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: .04)
              : const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: .06)
                : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_list_rounded,
              size: 18,
              color: BrandColors.primary,
            ),
            const SizedBox(width: 8),
            Text(
              status,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 6),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconToolbarButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  const _IconToolbarButton({
    required this.icon,
    required this.tooltip,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: tooltip,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: .04)
              : const Color(0xFFF7F8FA),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: .06)
                : Colors.transparent,
          ),
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 19, color: BrandColors.primary),
        ),
      ),
    );
  }
}

// =============================================================================
// HEADERS
// =============================================================================

class _LiveIndicator extends StatelessWidget {
  const _LiveIndicator();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 9,
      ),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: isDark ? .12 : .08),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.green.withValues(alpha: isDark ? .25 : .15),
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulsingDot(),
          SizedBox(width: 7),
          Text(
            'Live updates',
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  const _PulsingDot();

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: .3,
        end: 1,
      ).animate(controller),
      child: Container(
        width: 7,
        height: 7,
        decoration: const BoxDecoration(
          color: Colors.green,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _TabletHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const _TabletHeader({
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(
              Icons.menu_rounded,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'LogiTrack',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              letterSpacing: -0.3,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
          const Spacer(),
          const _LiveIndicator(),
        ],
      ),
    );
  }
}

class _MobileHeader extends StatelessWidget {
  final VoidCallback onMenuPressed;

  const _MobileHeader({
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: Row(
        children: [
          IconButton(
            onPressed: onMenuPressed,
            icon: Icon(
              Icons.menu_rounded,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            'LogiTrack',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
          const Spacer(),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: .10),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_outline_rounded,
              size: 19,
              color: BrandColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _MobileMenuItem({
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = selected
        ? BrandColors.primary
        : (isDark ? Colors.white70 : BrandColors.secondary.withValues(alpha: .65));

    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: color,
          fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      trailing: selected
          ? Icon(
              Icons.check_rounded,
              color: color,
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

// =============================================================================
// EXPORT OPTION
// =============================================================================

class _ExportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ExportOption({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: BrandColors.primary.withValues(alpha: .08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: BrandColors.primary,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: isDark ? Colors.white : BrandColors.secondary,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: isDark ? Colors.white70 : BrandColors.secondary.withValues(alpha: .5),
        ),
      ),
      trailing: Icon(
        Icons.chevron_right_rounded,
        color: isDark ? Colors.white70 : BrandColors.secondary,
      ),
    );
  }
}

// =============================================================================
// EMPTY / LOADING / ERROR
// =============================================================================

class _EmptyDeliveries extends StatelessWidget {
  final bool hasFilter;
  final VoidCallback onClear;

  const _EmptyDeliveries({
    required this.hasFilter,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF101B2B) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: .06)
              : const Color(0xFFE7EBF0),
        ),
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: .08),
              shape: BoxShape.circle,
            ),
            child: Icon(
              hasFilter
                  ? Icons.search_off_rounded
                  : Icons.inventory_2_outlined,
              size: 30,
              color: BrandColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            hasFilter
                ? 'No matching deliveries'
                : 'No deliveries yet',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white : BrandColors.secondary,
            ),
          ),
          const SizedBox(height: 7),
          Text(
            hasFilter
                ? 'Try changing your search or status filter.'
                : 'Your deliveries will appear here.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: theme.colorScheme.onSurface.withValues(alpha: .5),
            ),
          ),
          if (hasFilter) ...[
            const SizedBox(height: 18),
            OutlinedButton(
              onPressed: onClear,
              style: OutlinedButton.styleFrom(
                foregroundColor: BrandColors.primary,
                side: const BorderSide(color: BrandColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Clear filters',
                style: GoogleFonts.poppins(
                  color: BrandColors.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DashboardLoading extends StatelessWidget {
  const _DashboardLoading();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: BrandColors.primary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Loading deliveries...',
            style: GoogleFonts.poppins(
              color: isDark ? Colors.white70 : BrandColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardError extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _DashboardError({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: Colors.red.withValues(alpha: .08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.cloud_off_rounded,
                size: 32,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Unable to load deliveries',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: isDark ? Colors.white : BrandColors.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: isDark ? Colors.white70 : BrandColors.secondary,
              ),
            ),
            const SizedBox(height: 18),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: Text(
                'Retry',
                style: GoogleFonts.poppins(),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: BrandColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================================
// ANIMATED BACKGROUND
// =============================================================================

class _DashboardBackground extends StatelessWidget {
  final AnimationController pulse;
  final AnimationController route;
  final Widget child;

  const _DashboardBackground({
    required this.pulse,
    required this.route,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: Listenable.merge([pulse, route]),
            builder: (context, child) {
              return CustomPaint(
                painter: _DashboardBackgroundPainter(
                  pulse: pulse.value,
                  routeProgress: route.value,
                  isDark: isDark,
                ),
              );
            },
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

class _DashboardBackgroundPainter extends CustomPainter {
  final double pulse;
  final double routeProgress;
  final bool isDark;

  _DashboardBackgroundPainter({
    required this.pulse,
    required this.routeProgress,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final basePaint = Paint();

    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: isDark
          ? const [
              Color(0xFF08111F),
              Color(0xFF0B1728),
            ]
          : const [
              Color(0xFFF8FAFC),
              Color(0xFFF2F6FC),
            ],
    ).createShader(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

    basePaint.shader = gradient;

    canvas.drawRect(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      basePaint,
    );

    // Use BrandColors.primary for glow
    final glowPaint = Paint()
      ..color = (isDark ? Colors.blue : BrandColors.primary)
          .withValues(alpha: .035 + pulse * .02)
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        80,
      );

    canvas.drawCircle(
      Offset(
        size.width * .85,
        size.height * .10,
      ),
      160 + pulse * 20,
      glowPaint,
    );

    final pathPaint = Paint()
      ..color = (isDark ? Colors.cyan : BrandColors.primaryLight)
          .withValues(alpha: .035)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..moveTo(
        size.width * .05,
        size.height * .8,
      )
      ..quadraticBezierTo(
        size.width * .45,
        size.height * (.55 - routeProgress * .05),
        size.width * .95,
        size.height * .35,
      );

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(
    covariant _DashboardBackgroundPainter oldDelegate,
  ) {
    return oldDelegate.pulse != pulse ||
        oldDelegate.routeProgress != routeProgress ||
        oldDelegate.isDark != isDark;
  }
}