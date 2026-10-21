import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/customIcons.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = MediaQuery.of(context).size.height;
        final isMobile = screenWidth <= 600;
        final isTablet = screenWidth > 600 && screenWidth <= 1000;
        final isDesktop = screenWidth > 1000;

        return Container(
          color: const Color(0xff1F1F2E),
          child: isDesktop
              ? _buildDesktopFooter(context)
              : _buildMobileFooter(context),
        );
      },
    );
  }

  // ===========================================================================
  // DESKTOP FOOTER
  // ===========================================================================

  Widget _buildDesktopFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Main Footer Content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Get In Touch
              Expanded(
                flex: 1,
                child: _buildGetInTouch(context),
              ),
              const SizedBox(width: 30),

              // Quick Links
              Expanded(
                flex: 1,
                child: _buildQuickLinks(context),
              ),
              const SizedBox(width: 30),

              // Newsletter
              Expanded(
                flex: 2,
                child: _buildNewsletter(context),
              ),
            ],
          ),

          const SizedBox(height: 30),

          // Divider
          const Divider(height: 1, color: Colors.white54),

          const SizedBox(height: 16),

          // Bottom Section
          _buildBottomSection(context),
        ],
      ),
    );
  }

  // ===========================================================================
  // MOBILE FOOTER
  // ===========================================================================

  Widget _buildMobileFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Get In Touch
          _buildGetInTouch(context),
          const SizedBox(height: 24),

          // Quick Links
          _buildQuickLinks(context),
          const SizedBox(height: 24),

          // Newsletter
          _buildNewsletter(context),
          const SizedBox(height: 24),

          // Divider
          const Divider(height: 1, color: Colors.white54),
          const SizedBox(height: 16),

          // Bottom Section
          _buildBottomSection(context),
        ],
      ),
    );
  }

  // ===========================================================================
  // GET IN TOUCH SECTION
  // ===========================================================================

  Widget _buildGetInTouch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Get In Touch",
          style: GoogleFonts.poppins(
            color: const Color(0xFFFF4800),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),

        _buildContactItem(
          icon: Icons.location_on,
          text: "123 Street, New York, USA",
        ),
        const SizedBox(height: 12),

        _buildContactItem(
          icon: Icons.phone,
          text: "+012 345 67890",
          isBold: true,
        ),
        const SizedBox(height: 12),

        _buildContactItem(
          icon: Icons.email,
          text: "info@example.com",
        ),
        const SizedBox(height: 16),

        const SocialIcons(shouldEnableHover: true),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    bool isBold = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: const Color(0xFFFF4800),
          size: 20,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // QUICK LINKS SECTION
  // ===========================================================================


Widget _buildQuickLinks(BuildContext context) {
  final links = [
    'Home',
    'Company',
    'Tracking',
    'Services',
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Quick Links',
        style: GoogleFonts.poppins(
          color: const Color(0xFFFF4800),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 16),

      ...links.map(
        (link) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _buildQuickLink(context, link),
        ),
      ),
    ],
  );
}

Widget _buildQuickLink(BuildContext context, String title) {
  return InkWell(
    onTap: () {
      switch (title) {
        case 'Home':
          context.go('/');
          break;

        case 'Company':
          context.go('/company');
          break;

        case 'Tracking':
          context.go('/tracking');
          break;

        case 'Services':
          context.go('/services');
          break;
      }
    },
    borderRadius: BorderRadius.circular(4),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Color(0xFFFF4800),
            size: 12,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}


  // Widget _buildQuickLinks(BuildContext context) {
  //   final links = [
  //     'Home',
  //     'Company',
  //     'Tracking',
  //     'Services',
     
  //   ];

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     mainAxisSize: MainAxisSize.min,
  //     children: [
  //       Text(
  //         "Quick Links",
  //         style: GoogleFonts.poppins(
  //           color: const Color(0xFFFF4800),
  //           fontSize: 24,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //       const SizedBox(height: 16),

  //       ...links.map((link) => Padding(
  //             padding: const EdgeInsets.only(bottom: 10),
  //             child: _buildQuickLink(link),
  //           )),
  //     ],
  //   );
  // }

  // Widget _buildQuickLink(String title) {
  //   return InkWell(
  //     // onTap: () {
  //     //   // Navigate to respective page
  //     // },
      
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min,
  //       children: [
  //         Icon(
  //           Icons.arrow_forward_ios_outlined,
  //           color: const Color(0xFFFF4800),
  //           size: 12,
  //         ),
  //         const SizedBox(width: 8),
  //         Text(
  //           title,
  //           style: GoogleFonts.poppins(
  //             color: Colors.white70,
  //             fontSize: 14,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // ===========================================================================
  // NEWSLETTER SECTION
  // ===========================================================================

  Widget _buildNewsletter(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;
    final emailController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Newsletter",
          style: GoogleFonts.poppins(
            color: const Color(0xFFFF4800),
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          "Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum.",
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),

        // Email Input
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: SizedBox(
                height: 48,
                child: TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Your Email Address',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: Color(0xFFFF4800),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                  onSubmitted: (_) => _handleNewsletterSignup(context, emailController),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Sign Up Button
            InkWell(
              onTap: () => _handleNewsletterSignup(context, emailController),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4800),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    isMobile ? 'Sign Up' : 'Sign Up',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleNewsletterSignup(BuildContext context, TextEditingController controller) {
    final email = controller.text.trim();
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter your email address',
            style: GoogleFonts.poppins(),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!email.contains('@') || !email.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a valid email address',
            style: GoogleFonts.poppins(),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Thank you for subscribing! 🎉',
          style: GoogleFonts.poppins(),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
      ),
    );
    controller.clear();
  }

  // ===========================================================================
  // BOTTOM SECTION
  // ===========================================================================

  Widget _buildBottomSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 600;

    if (isMobile) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Copyright Text
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.poppins(fontSize: 13),
              children: [
                const TextSpan(
                  text: '@ ',
                  style: TextStyle(color: Colors.white54),
                ),
                TextSpan(
                  text: 'Your Site Name. ',
                  style: const TextStyle(color: Color(0xFFFF4800)),
                ),
                const TextSpan(
                  text: 'All Rights Reserved. Designed by ',
                  style: TextStyle(color: Colors.white54),
                ),
                TextSpan(
                  text: 'SmartTech',
                  style: const TextStyle(color: Color(0xFFFF4800)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Links
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            children: [
              _buildFooterLink('Privacy'),
              _buildFooterLink('Terms'),
              _buildFooterLink('FAQs'),
              _buildFooterLink('Help'),
            ],
          ),
          const SizedBox(height: 16),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Copyright Text
        RichText(
          text: TextSpan(
            style: GoogleFonts.poppins(fontSize: 13),
            children: [
              const TextSpan(
                text: '@ ',
                style: TextStyle(color: Colors.white54),
              ),
              TextSpan(
                text: 'Your Site Name. ',
                style: const TextStyle(color: Color(0xFFFF4800)),
              ),
              const TextSpan(
                text: 'All Rights Reserved. Designed by ',
                style: TextStyle(color: Colors.white54),
              ),
              TextSpan(
                text: 'SmartTech',
                style: const TextStyle(color: Color(0xFFFF4800)),
              ),
            ],
          ),
        ),

        // Links
        Row(
          children: [
            _buildFooterLink('Privacy'),
            const SizedBox(width: 20),
            _buildFooterLink('Terms'),
            const SizedBox(width: 20),
            _buildFooterLink('FAQs'),
            const SizedBox(width: 20),
            _buildFooterLink('Help'),
          ],
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return InkWell(
      onTap: () {
        // Navigate to respective page
      },
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 13,
        ),
      ),
    );
  }
}