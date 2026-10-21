
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/appbar.dart';




import 'package:logistics_website/src/features/trackingPage/view/tracking_page.dart';

class TrackingScreen extends ConsumerStatefulWidget {
  const TrackingScreen({super.key});

  @override
  ConsumerState<TrackingScreen> createState() => _HeroSectionState();
}

class _HeroSectionState extends ConsumerState<TrackingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _trackingController =
      TextEditingController();

  static const Color primaryColor = Color(0xFFFF4800);
  static const Color secondaryColor = Color(0xFFFF6B35);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _trackingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveConfig.isMobile(context);

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                       AppBarWidget(onNavigate: (String value) {  },),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                  
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF171727),
                          Color(0xFF292941),
                          Color(0xFF202035),
                        ],
                      ),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 16 : 32,
                          vertical: isMobile ? 35 : 55,
                        ),
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 1100,
                          ),
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _buildBadge(isMobile),
                                  const SizedBox(height: 24),
                                  _buildHeading(context, isMobile),
                                  const SizedBox(height: 16),
                                  _buildSubtitle(isMobile),
                                  SizedBox(
                                    height: isMobile ? 28 : 38,
                                  ),
                                  _buildSearchSection(context, isMobile),
                                  const SizedBox(height: 32),
                                  _buildFeatures(isMobile),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // HERO BADGE
  // ============================================================

  Widget _buildBadge(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 14 : 20,
        vertical: isMobile ? 8 : 10,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.20),
            secondaryColor.withValues(alpha: 0.08),
          ],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_shipping_rounded,
            color: secondaryColor,
            size: 19,
          ),
          const SizedBox(width: 9),
          Text(
            'SAFE & FASTER DELIVERY',
            style: GoogleFonts.poppins(
              color: secondaryColor,
              fontSize: isMobile ? 11 : 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // MAIN HEADING
  // ============================================================

  Widget _buildHeading(BuildContext context, bool isMobile) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Logistics Services\n',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: 'That Move You Forward',
            style: GoogleFonts.poppins(
              color: secondaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
        fontSize: isMobile ? 32 : 52,
        height: 1.25,
        letterSpacing: -0.6,
      ),
    );
  }

  // ============================================================
  // SUBTITLE
  // ============================================================

  Widget _buildSubtitle(bool isMobile) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Text(
        'Fast, reliable and secure delivery solutions for your '
        'business. Track your shipment and stay informed about '
        'your delivery every step of the way.',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: isMobile ? 13 : 16,
          height: 1.9,
          color: Colors.white.withValues(alpha: 0.75),
        ),
      ),
    );
  }

  // ============================================================
  // TRACKING SEARCH SECTION
  // ============================================================

  Widget _buildSearchSection(
    BuildContext context,
    bool isMobile,
  ) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 12 : 16),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.12),
          ),
        ),
        child: Form(
          key: _formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final narrowLayout = constraints.maxWidth < 430;

              if (narrowLayout) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildTrackingInput(isMobile: true),
                    const SizedBox(height: 12),
                    _buildTrackButton(isMobile: true),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(
                    child: _buildTrackingInput(
                      isMobile: isMobile,
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: isMobile ? 100 : 170,
                    height: 52,
                    child: _buildTrackButton(
                      isMobile: isMobile,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTrackingInput({required bool isMobile}) {
    return TextFormField(
      controller: _trackingController,
      style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 14,
      ),
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.10),
        hintText: 'Enter Tracking ID',
        hintStyle: GoogleFonts.poppins(
          color: Colors.white60,
          fontSize: 13,
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: Colors.white70,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.white.withValues(alpha: 0.18),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: secondaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Please enter a tracking number';
        }

        return null;
      },
      onFieldSubmitted: (_) => _submitTracking(context),
    );
  }

  Widget _buildTrackButton({required bool isMobile}) {
    return SizedBox(
      height: 52,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _submitTracking(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isMobile) ...[
              const Icon(
                Icons.track_changes_rounded,
                size: 19,
              ),
              const SizedBox(width: 7),
            ],
            Flexible(
              child: Text(
                isMobile ? 'Track' : 'Track & Trace',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // HERO FEATURES
  // ============================================================

  Widget _buildFeatures(bool isMobile) {
    final features = [
      (
        icon: Icons.verified_user_outlined,
        title: 'Secure Delivery',
      ),
      (
        icon: Icons.speed_rounded,
        title: 'Fast Transport',
      ),
      (
        icon: Icons.location_on_outlined,
        title: 'Shipment Tracking',
      ),
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: isMobile ? 16 : 32,
      runSpacing: 16,
      children: features.map((feature) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              feature.icon,
              size: 19,
              color: secondaryColor,
            ),
            const SizedBox(width: 8),
            Text(
              feature.title,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // ============================================================
  // TRACKING NAVIGATION
  // ============================================================

  void _submitTracking(BuildContext context) {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final trackingNumber = _trackingController.text.trim();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TrackingScreenDetails(
          tracking_number: trackingNumber,
        ),
      ),
    );
  }
}
