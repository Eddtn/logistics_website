
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/src/features/aboutPage/widgets/aboutUsWidget.dart';
import 'package:logistics_website/src/features/aboutPage/widgets/deliveryTeamSection.dart';
import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';
import 'package:logistics_website/src/features/homescreen/widgets/testimonialWidget.dart';
import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
import 'package:logistics_website/src/features/services/widget/chooseUs.dart';
import 'package:logistics_website/src/features/services/widget/ourserviceWidget.dart';
import 'package:logistics_website/src/features/trackingPage/view/tracking_page.dart';



// =============================================================================
// MAIN HOME SCREEN
// =============================================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _fadeController;
  final bool _showFab = false;
  final bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(_scrollListener);
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      debugPrint('Screen width: ${screenSize.width}, height: ${screenSize.height}');
    });
  }

  // void _scrollListener() {
  //   if (_scrollController.offset > 200 && !_showFab) {
  //     setState(() => _showFab = true);
  //   } else if (_scrollController.offset <= 200 && _showFab) {
  //     setState(() => _showFab = false);
  //   }
  // }

  @override
  void dispose() {
    // _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Main content with fade animation
            FadeTransition(
              opacity: _fadeController,
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // App Bar
                     AppBarWidget(onNavigate: (String value) {  },),
                    
                    // Hero Section
                    const _HeroSection(),
                    
                    // About Section
                    const aboutUsWidget(),
                    
                    // Quote Section
                    const RequestQuoteWidget(),
                    
                    // Services Section
                    const OurServiceWidget(),
                    
                    // Why Choose Us
                    const WhyChooseUs(),
                    
                    // Pricing Section
                    // const PricingSection(),
                    
                    // Team Section
                    const DeliveryTeamSection(),
                    
                    // Testimonials
                    const TestimonySection(),
                    
                    // Blog Section
                    // const BlogSection(),
                    
                    // Footer
                    const FooterPage(),
                  ],
                ),
              ),
            ),
            
            // Scroll to top FAB
            _buildFloatingActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      bottom: _showFab ? 24 : -80,
      right: 24,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showFab ? 1.0 : 0.0,
        child: Material(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: InkWell(
            onTap: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutCubic,
              );
            },
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(
                Icons.keyboard_double_arrow_up_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// HERO SECTION
// =============================================================================

class _HeroSection extends ConsumerStatefulWidget {
  const _HeroSection();

  @override
  ConsumerState<_HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<_HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final isTablet = ResponsiveConfig.isTablet(context);
    final isDesktop = ResponsiveConfig.isDesktop(context);

    return HeroSectionWidget(
      height: ResponsiveConfig.getHeroHeight(context),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Main Title
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 8 : 16,
                    vertical: isMobile ? 4 : 8,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFFFF4800).withValues(alpha: 0.15),
                        const Color(0xFFFF6B35).withValues(alpha: 0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "🚚 Safe & Faster",
                    style: TextStyle(
                      color: const Color(0xFFFF4800),
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                
                const SizedBox(height: 20),

                // Main Heading
                Text(
                  "Logistics Services",
                  style: GoogleFonts.poppins(
                    fontSize: ResponsiveConfig.getSubtitleFontSize(context),
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "Fast, Reliable & Secure Delivery",
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withValues(alpha: 0.8),
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                
                SizedBox(height: isMobile ? 24 : 32),

                // Search Section
                _buildSearchSection(context, isMobile, isTablet, isDesktop),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    bool isDesktop,
  ) {
    final formKey = GlobalKey<FormState>();
    final controller = TextEditingController();

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 8 : 16,
        vertical: isMobile ? 8 : 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.1),
        ),
      ),
      child: Form(
        key: formKey,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Search Input
            Container(
              constraints: BoxConstraints(
                maxWidth: ResponsiveConfig.getSearchWidth(context),
              ),
              child: SizedBox(
                height: 50,
                width: isMobile ? 200 : 300,
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white.withValues(alpha: 0.15),
                    hintText: 'Enter Tracking ID',
                    hintStyle: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: isMobile ? 13 : 14,
                    ),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.white.withValues(alpha: 0.6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFFF4800),
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 12 : 16,
                      vertical: 12,
                    ),
                  ),
                  validator: (value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Please enter a tracking number';
                    }
                    return null;
                  },
                  onFieldSubmitted: (_) {
                    if (formKey.currentState?.validate() ?? false) {
                      _trackDelivery(context, controller.text.trim());
                    }
                  },
                ),
              ),
            ),
            
            const SizedBox(width: 12),

            // Track Button
            SizedBox(
              height: 50,
              width: isMobile 
                  ? 100 
                  : ResponsiveConfig.getButtonWidth(context),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    _trackDelivery(context, controller.text.trim());
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4800),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!isMobile) ...[
                      const Icon(Icons.track_changes_rounded, size: 20),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      isMobile ? 'Track' : 'Track & Trace',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _trackDelivery(BuildContext context, String trackingNumber) {
    if (trackingNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a tracking number"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xFFDC2626),
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TrackingScreenDetails(
          tracking_number: trackingNumber,
        ),
      ),
    );
  }
}

// =============================================================================
// SECTION WRAPPER - For consistent spacing and styling
// =============================================================================

class SectionWrapper extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;
  final bool centerTitle;
  final EdgeInsets? padding;

  const SectionWrapper({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.centerTitle = true,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final padding = this.padding ?? ResponsiveConfig.getPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 32 : 48,
        horizontal: padding.horizontal,
      ),
      child: Column(
        crossAxisAlignment: centerTitle 
            ? CrossAxisAlignment.center 
            : CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            _SectionHeader(
              title: title!,
              subtitle: subtitle,
              centerTitle: centerTitle,
            ),
            const SizedBox(height: 32),
          ],
          child,
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool centerTitle;

  const _SectionHeader({
    required this.title,
    this.subtitle,
    this.centerTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: centerTitle 
          ? CrossAxisAlignment.center 
          : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w800,
            color: theme.brightness == Brightness.dark 
                ? Colors.white 
                : const Color(0xFF1A1A2E),
            letterSpacing: -0.5,
          ),
          textAlign: centerTitle ? TextAlign.center : TextAlign.start,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              fontWeight: FontWeight.w400,
              color: theme.brightness == Brightness.dark 
                  ? Colors.white.withValues(alpha: 0.7)
                  : const Color(0xFF4A4A6A),
              height: 1.6,
            ),
            textAlign: centerTitle ? TextAlign.center : TextAlign.start,
          ),
        ],
        const SizedBox(height: 16),
        Container(
          width: centerTitle ? 60 : 40,
          height: 3,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// LOADING SHIMMER EFFECT
// =============================================================================

class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    this.isLoading = true,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            final gradient = LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey.shade300,
                Colors.grey.shade100,
                Colors.grey.shade300,
              ],
              stops: const [0.0, 0.5, 1.0],
            ).createShader(bounds);
            return gradient;
          },
          child: widget.child,
        );
      },
    );
  }
}

// =============================================================================
// RESPONSIVE GRID
// =============================================================================

class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final int crossAxisCount;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;

  const ResponsiveGrid({
    super.key,
    required this.children,
    this.crossAxisCount = 3,
    this.spacing = 16,
    this.runSpacing = 16,
    this.childAspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final isTablet = ResponsiveConfig.isTablet(context);

    int columns = crossAxisCount;
    if (isMobile) columns = 1;
    if (isTablet && crossAxisCount > 2) columns = 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: spacing,
        mainAxisSpacing: runSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
    );
  }
}

// =============================================================================
// RESPONSIVE WRAPPER
// =============================================================================

class ResponsiveWrapper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveWrapper({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (ResponsiveConfig.isMobile(context)) {
      return mobile;
    }
    if (ResponsiveConfig.isTablet(context)) {
      return tablet ?? mobile;
    }
    return desktop ?? tablet ?? mobile;
  }
}

// =============================================================================
// RESPONSIVE BUTTON
// =============================================================================

class ResponsiveButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final Color? color;

  const ResponsiveButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);
    final buttonColor = color ?? const Color(0xFFFF4800);

    if (isOutlined) {
      return OutlinedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: isLoading
            ? const SizedBox(
                height: 16,
                width: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(icon),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          foregroundColor: buttonColor,
          side: BorderSide(color: buttonColor),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile ? 12 : 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: isLoading ? null : onPressed,
      icon: isLoading
          ? const SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.white,
              ),
            )
          : Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 24,
          vertical: isMobile ? 12 : 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

// =============================================================================
// RESPONSIVE CARD
// =============================================================================

class ResponsiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? elevation;
  final VoidCallback? onTap;

  const ResponsiveCard({
    super.key,
    required this.child,
    this.padding,
    this.elevation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final defaultPadding = ResponsiveConfig.isMobile(context)
        ? const EdgeInsets.all(16)
        : const EdgeInsets.all(24);

    return Card(
      elevation: elevation ?? 2,
      color: isDark ? const Color(0xFF1A1A2E) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark 
              ? Colors.white.withValues(alpha: 0.05) 
              : const Color(0xFFE8ECF2),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: padding ?? defaultPadding,
          child: child,
        ),
      ),
    );
  }
}



// =============================================================================
// RESPONSIVE CONFIGURATION
// =============================================================================



class ResponsiveConfig {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

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
    if (isMobile(context)) return const EdgeInsets.symmetric(horizontal: 16);
    if (isTablet(context)) return const EdgeInsets.symmetric(horizontal: 32);
    return const EdgeInsets.symmetric(horizontal: 64);
  }

  static double getHeroHeight(BuildContext context) {
    final height = getHeight(context);
    if (isMobile(context)) return height * 0.6;
    if (isTablet(context)) return height * 0.55;
    return height * 0.7;
  }

  static double getTitleFontSize(BuildContext context) {
    if (isMobile(context)) return 32;
    if (isTablet(context)) return 48;
    return 56;
  }

  static double getSubtitleFontSize(BuildContext context) {
    if (isMobile(context)) return 24;
    if (isTablet(context)) return 36;
    return 42;
  }

  static double getSearchWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 350;
    return 400;
  }

  static double getButtonWidth(BuildContext context) {
    if (isMobile(context)) return double.infinity;
    if (isTablet(context)) return 140;
    return 160;
  }
}