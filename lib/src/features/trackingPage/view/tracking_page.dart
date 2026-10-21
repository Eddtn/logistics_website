// // TRK-1761095332206

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/trackingPage/view_model/tracking_viewmodel.dart';
import 'package:logistics_website/src/features/trackingPage/model/tracking_model.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:google_fonts/google_fonts.dart';

// =============================================================================
// RESPONSIVE CONFIGURATION
// =============================================================================

class ResponsiveConfig {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileBreakpoint &&
      MediaQuery.of(context).size.width < tabletBreakpoint;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletBreakpoint;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static EdgeInsets getPadding(BuildContext context) {
    if (isMobile(context)) return const EdgeInsets.all(16);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(32);
  }

  static double getCardSpacing(BuildContext context) {
    if (isMobile(context)) return 12;
    return 16;
  }
}

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
// MAIN TRACKING DETAIL PAGE
// =============================================================================

class TrackingScreenDetails extends ConsumerStatefulWidget {
  final String tracking_number;

  const TrackingScreenDetails({super.key, required this.tracking_number});

  @override
  ConsumerState<TrackingScreenDetails> createState() =>
      _TrackingDetailPageState();
}

class _TrackingDetailPageState extends ConsumerState<TrackingScreenDetails>
    with SingleTickerProviderStateMixin {
  late final String _trackingNumber;
  late final AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _trackingNumber = widget.tracking_number;
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _refresh() async {
    await ref.read(trackingProvider(_trackingNumber).notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final trackingAsync = ref.watch(trackingProvider(_trackingNumber));
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF08111F) : BrandColors.surface,
      appBar: _buildAppBar(context),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: BrandColors.primary,
        child: FadeTransition(
          opacity: _fadeController,
          child: trackingAsync.when(
            loading: () => const _TrackingLoading(),
            error: (err, _) => _TrackingError(
              error: err,
              onRetry: _refresh,
            ),
            data: (tracking) {
              if (tracking == null) {
                return const _NoDeliveryFound();
              }
              return _buildSuccess(tracking);
            },
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);

    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_rounded),
        tooltip: 'Go back',
      ),
      title: Text(
        'Tracking Details',
        style: GoogleFonts.poppins(
          fontSize: isMobile ? 18 : 20,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      backgroundColor: BrandColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      actions: [
        IconButton(
          onPressed: _refresh,
          icon: const Icon(Icons.refresh_rounded),
          tooltip: 'Refresh',
        ),
        const SizedBox(width: 4),
      ],
    );
  }

  Widget _buildSuccess(TrackingModel tracking) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final padding = ResponsiveConfig.getPadding(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Card - Now with enhanced UI
          _statusCard(tracking),
          const SizedBox(height: 20),

          // Tracking Timeline
          _trackingTimeline(tracking),
          const SizedBox(height: 20),

          // Package Summary
          _packageSummary(tracking),
          const SizedBox(height: 20),

          // Delivery Info
          _deliveryInfo(tracking),
          const SizedBox(height: 20),

          // Action Buttons
          _actionButtons(tracking, isMobile),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // ===========================================================================
  // STATUS CARD
  // ===========================================================================

  Widget _statusCard(TrackingModel tracking) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveConfig.isMobile(context);
    final statusColor = _getStatusColor(tracking.status);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            isDark ? const Color(0xFF0B1728) : Colors.white,
            isDark ? const Color(0xFF0F1F32) : const Color(0xFFFFFBF8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : BrandColors.primary.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.05),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tracking Number',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.4),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      tracking.tracking_number,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: statusColor.withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      tracking.status,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: Theme.of(context)
                .colorScheme
                .onSurface
                .withValues(alpha: 0.06),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _statusInfoItem(
                icon: Icons.calendar_today_rounded,
                label: 'Estimated Delivery',
                value: tracking.estimated_delivery,
              ),
              const SizedBox(width: 16),
              _statusInfoItem(
                icon: Icons.access_time_rounded,
                label: 'Delivery Time',
                value: tracking.delivery_time,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statusInfoItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: BrandColors.primary,
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
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // TRACKING TIMELINE
  // ===========================================================================

  Widget _trackingTimeline(TrackingModel tracking) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Build timeline events based on status
    final events = _buildTimelineEvents(tracking);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0B1728) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : BrandColors.primary.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.timeline_rounded,
                color: BrandColors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Tracking Timeline',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : BrandColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ...events.asMap().entries.map((entry) {
            final index = entry.key;
            final event = entry.value;
            final isLast = index == events.length - 1;
            final currentEventIndex = _getCurrentEventIndex(events, tracking.status);
            final isActive = index <= currentEventIndex;

            return _TimelineItem(
              event: event,
              isActive: isActive,
              isLast: isLast,
              status: tracking.status,
            );
          }),
        ],
      ),
    );
  }

  List<_TimelineEvent> _buildTimelineEvents(TrackingModel tracking) {
    return [
      _TimelineEvent(
        icon: Icons.receipt_long_rounded,
        title: 'Order Created',
        subtitle: 'Shipment order has been created',
        time: _formatDate(DateTime.now().subtract(const Duration(days: 2))),
        status: 'pending',
      ),
      _TimelineEvent(
        icon: Icons.local_shipping_rounded,
        title: 'Dispatched',
        subtitle: 'Package has been dispatched',
        time: _formatDate(DateTime.now().subtract(const Duration(days: 1))),
        status: 'dispatched',
      ),
      _TimelineEvent(
        icon: Icons.route_rounded,
        title: 'In Transit',
        subtitle: 'Package is on the way',
        time: _formatDate(DateTime.now().subtract(const Duration(hours: 12))),
        status: 'in-transit',
      ),
      _TimelineEvent(
        icon: Icons.delivery_dining_rounded,
        title: 'Out for Delivery',
        subtitle: 'Package is out for delivery',
        time: _formatDate(DateTime.now().subtract(const Duration(hours: 4))),
        status: 'out-for-delivery',
      ),
      _TimelineEvent(
        icon: Icons.check_circle_rounded,
        title: 'Delivered',
        subtitle: 'Package has been delivered',
        time: _formatDate(DateTime.now()),
        status: 'delivered',
      ),
    ];
  }

  int _getCurrentEventIndex(List<_TimelineEvent> events, String status) {
    final statusMap = {
      'pending': 0,
      'dispatched': 1,
      'in-transit': 2,
      'out for delivery': 3,
      'delivered': 4,
      'cancelled': -1,
    };
    final index = statusMap[status.toLowerCase()] ?? 0;
    return index.clamp(0, events.length - 1);
  }

  // ===========================================================================
  // PACKAGE SUMMARY
  // ===========================================================================

  Widget _packageSummary(TrackingModel tracking) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveConfig.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0B1728) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : BrandColors.primary.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.inventory_2_outlined,
                color: BrandColors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Package Summary',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : BrandColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isMobile) ...[
            _summaryItemMobile(
              icon: Icons.person_outline_rounded,
              label: 'Sender',
              value: tracking.sender_name,
              subtitle: tracking.dispatch_location,
            ),
            const SizedBox(height: 12),
            _summaryItemMobile(
              icon: Icons.person_rounded,
              label: 'Receiver',
              value: tracking.receiver_name,
              subtitle: tracking.destination,
            ),
            const SizedBox(height: 12),
            _summaryItemMobile(
              icon: Icons.inventory_2_rounded,
              label: 'Shipment',
              value: tracking.shipment,
              subtitle: 'Qty: ${tracking.quantity}',
            ),
          ] else ...[
            Row(
              children: [
                Expanded(
                  child: _summaryItemDesktop(
                    icon: Icons.person_outline_rounded,
                    label: 'Sender',
                    value: tracking.sender_name,
                    subtitle: tracking.dispatch_location,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _summaryItemDesktop(
                    icon: Icons.person_rounded,
                    label: 'Receiver',
                    value: tracking.receiver_name,
                    subtitle: tracking.destination,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _summaryItemDesktop(
                    icon: Icons.inventory_2_rounded,
                    label: 'Shipment',
                    value: tracking.shipment,
                    subtitle: 'Qty: ${tracking.quantity}',
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _summaryItemMobile({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : BrandColors.primaryBg.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: BrandColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryItemDesktop({
    required IconData icon,
    required String label,
    required String value,
    required String subtitle,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : BrandColors.primaryBg.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: BrandColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // DELIVERY INFO
  // ===========================================================================

  Widget _deliveryInfo(TrackingModel tracking) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveConfig.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0B1728) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : BrandColors.primary.withValues(alpha: 0.1),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: BrandColors.primary,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                'Delivery Information',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : BrandColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (isMobile) ...[
            _infoItemMobile(
              icon: Icons.payments_rounded,
              label: 'Amount Due',
              value: '₦${tracking.amount_due}',
            ),
            const SizedBox(height: 8),
            _infoItemMobile(
              icon: Icons.payment_rounded,
              label: 'Payment Mode',
              value: tracking.payment_mode,
            ),
            const SizedBox(height: 8),
            _infoItemMobile(
              icon: Icons.description_rounded,
              label: 'Dispatch Details',
              value: tracking.dispatch_details,
            ),
          ] else ...[
            Row(
              children: [
                Expanded(
                  child: _infoItemDesktop(
                    icon: Icons.payments_rounded,
                    label: 'Amount Due',
                    value: '₦${tracking.amount_due}',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _infoItemDesktop(
                    icon: Icons.payment_rounded,
                    label: 'Payment Mode',
                    value: tracking.payment_mode,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _infoItemDesktop(
                    icon: Icons.description_rounded,
                    label: 'Dispatch Details',
                    value: tracking.dispatch_details,
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _infoItemMobile({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : BrandColors.primaryBg.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: BrandColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoItemDesktop({
    required IconData icon,
    required String label,
    required String value,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.03)
            : BrandColors.primaryBg.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: BrandColors.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withValues(alpha: 0.4),
                  ),
                ),
                Text(
                  value,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isDark ? Colors.white : BrandColors.secondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================================
  // ACTION BUTTONS
  // ===========================================================================

  Widget _actionButtons(TrackingModel tracking, bool isMobile) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () => _generateAndPrintPdf(tracking),
            icon: const Icon(Icons.download_rounded, color: Colors.white),
            label: Text(
              isMobile ? 'Receipt' : 'Download Receipt',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: BrandColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24,
                vertical: isMobile ? 14 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _shareTracking(tracking),
            icon: const Icon(Icons.share_rounded),
            label: Text(
              isMobile ? 'Share' : 'Share Tracking',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: BrandColors.primary,
              side: const BorderSide(color: BrandColors.primary),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 24,
                vertical: isMobile ? 14 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // HELPER METHODS
  // ===========================================================================

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    if (diff.inHours > 0) return '${diff.inHours}h ago';
    if (diff.inMinutes > 0) return '${diff.inMinutes}m ago';
    return 'Just now';
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return BrandColors.success;
      case 'in-transit':
        return BrandColors.info;
      case 'out for delivery':
        return BrandColors.warning;
      case 'dispatched':
        return BrandColors.primary;
      case 'pending':
        return Colors.grey;
      case 'cancelled':
        return BrandColors.error;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return Icons.check_circle_rounded;
      case 'in-transit':
        return Icons.route_rounded;
      case 'out for delivery':
        return Icons.delivery_dining_rounded;
      case 'dispatched':
        return Icons.local_shipping_rounded;
      case 'pending':
        return Icons.schedule_rounded;
      case 'cancelled':
        return Icons.cancel_rounded;
      default:
        return Icons.help_rounded;
    }
  }

  void _shareTracking(TrackingModel tracking) {
    // Implement share functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share tracking information'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // ===========================================================================
  // PDF GENERATION
  // ===========================================================================

  Future<void> _generateAndPrintPdf(TrackingModel tracking) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(40),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Header
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Tracking Receipt',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.orange,
                      ),
                    ),
                    pw.Text(
                      '#${tracking.tracking_number}',
                      style: const pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),
                pw.Divider(),
                pw.SizedBox(height: 20),
                
                // Status
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(
                      'Status:',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Container(
                      padding: const pw.EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: pw.BoxDecoration(
                        color: _getPdfColor(tracking.status),
                        borderRadius: pw.BorderRadius.circular(8),
                      ),
                      child: pw.Text(
                        tracking.status,
                        style: const pw.TextStyle(
                          color: PdfColors.white,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 20),

                // Details
                _buildPdfRow('Sender', tracking.sender_name),
                _buildPdfRow('Receiver', tracking.receiver_name),
                _buildPdfRow('Shipment', tracking.shipment),
                _buildPdfRow('Quantity', tracking.quantity.toString()),
                _buildPdfRow('Amount Due', '₦${tracking.amount_due}'),
                _buildPdfRow('Payment Mode', tracking.payment_mode),
                _buildPdfRow('Estimated Delivery', tracking.estimated_delivery),
                _buildPdfRow('Destination', tracking.destination),
                
                pw.SizedBox(height: 30),
                pw.Divider(),
                pw.SizedBox(height: 10),
                
                pw.Center(
                  child: pw.Text(
                    'Thank you for choosing our logistics service!',
                    style: pw.TextStyle(
                      fontSize: 12,
                      color: PdfColors.grey,
                    ),
                  ),
                ),
                pw.SizedBox(height: 4),
                pw.Center(
                  child: pw.Text(
                    'Generated on ${DateTime.now().toString().substring(0, 16)}',
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

    try {
      await Printing.layoutPdf(onLayout: (_) => pdf.save());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Receipt opened for printing/download'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: BrandColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to generate PDF: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: BrandColors.error,
          ),
        );
      }
    }
  }

  pw.Widget _buildPdfRow(String label, String value) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            fontSize: 11,
            color: PdfColors.grey700,
          ),
        ),
        pw.Text(
          value,
          style: const pw.TextStyle(
            fontSize: 14,
            fontWeight: pw.FontWeight.bold,
          ),
        ),
        pw.SizedBox(height: 8),
      ],
    );
  }

  PdfColor _getPdfColor(String status) {
    switch (status.toLowerCase()) {
      case 'delivered':
        return PdfColors.green;
      case 'in-transit':
        return PdfColors.blue;
      case 'out for delivery':
        return PdfColors.orange;
      case 'dispatched':
        return PdfColors.orange700;
      case 'pending':
        return PdfColors.grey;
      case 'cancelled':
        return PdfColors.red;
      default:
        return PdfColors.grey;
    }
  }
}

// =============================================================================
// TIMELINE ITEM
// =============================================================================

class _TimelineEvent {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final String status;

  _TimelineEvent({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.status,
  });
}

class _TimelineItem extends StatelessWidget {
  final _TimelineEvent event;
  final bool isActive;
  final bool isLast;
  final String status;

  const _TimelineItem({
    required this.event,
    required this.isActive,
    required this.isLast,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isActive ? BrandColors.primary : Colors.grey.withValues(alpha: 0.3);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline line and dot
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isActive ? BrandColors.primary : Colors.grey.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isActive ? BrandColors.primary : Colors.grey.withValues(alpha: 0.3),
                  width: 2,
                ),
              ),
              child: Icon(
                event.icon,
                size: 18,
                color: isActive ? Colors.white : Colors.grey.withValues(alpha: 0.5),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: isActive ? BrandColors.primary.withValues(alpha: 0.3) : Colors.grey.withValues(alpha: 0.15),
              ),
          ],
        ),
        const SizedBox(width: 16),
        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive
                      ? (isDark ? Colors.white : BrandColors.secondary)
                      : (isDark ? Colors.white.withValues(alpha: 0.4) : Colors.grey.withValues(alpha: 0.5)),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                event.subtitle,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.5)
                      : Colors.grey.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                event.time,
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.3)
                      : Colors.grey.withValues(alpha: 0.4),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        if (isActive)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: BrandColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              'Current',
              style: GoogleFonts.poppins(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: BrandColors.primary,
              ),
            ),
          ),
      ],
    );
  }
}

// =============================================================================
// LOADING / ERROR STATES
// =============================================================================

class _TrackingLoading extends StatelessWidget {
  const _TrackingLoading();

  @override
  Widget build(BuildContext context) {
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
            'Loading tracking details...',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingError extends StatelessWidget {
  final Object error;
  final VoidCallback onRetry;

  const _TrackingError({
    required this.error,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
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
                color: BrandColors.error.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.error_outline_rounded,
                size: 32,
                color: BrandColors.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Unable to load tracking details',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Retry'),
              style: ElevatedButton.styleFrom(
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

class _NoDeliveryFound extends StatelessWidget {
  const _NoDeliveryFound();

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
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: BrandColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search_off_rounded,
                size: 40,
                color: BrandColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No Delivery Found',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: isDark ? Colors.white : BrandColors.secondary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'We couldn\'t find any delivery with this tracking number.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_rounded),
              label: const Text('Go Back'),
              style: ElevatedButton.styleFrom(
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