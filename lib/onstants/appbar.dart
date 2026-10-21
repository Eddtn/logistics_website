
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_website/onstants/drop_menu_text.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarWidget extends StatefulWidget {

   final ValueChanged<String> onNavigate;
  const AppBarWidget({super.key, required this.onNavigate});

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool _isExpanded = false;


  void _navigateTo(String title) {
  const routes = {
    'Home': '/',
    'Company': '/company',
    'Tracking': '/tracking',
    'Services': '/services',
  
    
  };

  final route = routes[title];

  if (route != null) {
    setState(() {
      _isExpanded = false;
    });

    context.go(route);
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top Bar (Contact Info)
        _buildTopBar(context),

        // Main Navigation Bar
        _buildMainNavBar(context),
      ],
    );
  }

  // ===========================================================================
  // TOP BAR
  // ===========================================================================

  Widget _buildTopBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Container(
      width: double.infinity, // Ensures full width
      color: const Color(0xFF1F1F2E),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 24,
        vertical: isMobile ? 10 : 6,
      ),
      child: isMobile
          ? _buildMobileTopBar()
          : _buildDesktopTopBar(),
    );
  }

  Widget _buildMobileTopBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Contact Info Row - Using Wrap to prevent overflow
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: [
            _buildContactItem(
              icon: Icons.phone,
              text: '+234813231124',
              iconSize: 14,
            ),
            Container(
              width: 1,
              height: 14,
              color: Colors.white54,
            ),
            _buildContactItem(
              icon: Icons.messenger_sharp,
              text: 'info@logisticssite.com',
              iconSize: 14,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopTopBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Contact Info - Centered
        Flexible(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 4,
            children: [
              _buildContactItem(
                icon: Icons.phone,
                text: '+234813231124',
              ),
              Container(
                width: 1,
                height: 16,
                color: Colors.white54,
              ),
              _buildContactItem(
                icon: Icons.messenger_sharp,
                text: 'info@logisticssite.com',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String text,
    double iconSize = 14,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // ===========================================================================
  // MAIN NAVIGATION BAR
  // ===========================================================================

  Widget _buildMainNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isTablet = screenWidth >= 800 && screenWidth < 1024;

    return Container(
      width: double.infinity, // Ensures full width
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 8 : 12,
      ),
      child: isMobile
          ? _buildMobileNav()
          : _buildDesktopNav(isTablet: isTablet),
    );
  }

  Widget _buildMobileNav() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Top Row: Logo + Menu Button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(),
            IconButton(
              icon: Icon(
                _isExpanded ? Icons.close : Icons.menu,
                color: const Color(0xFFFF4800),
                size: 28,
              ),
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
        // Dropdown Menu
        // if (_isExpanded) const DropMenuText(),
        if (_isExpanded)
  DropMenuText(
    onNavigate: _navigateTo,
  ),

      ],
    );
  }

  Widget _buildDesktopNav({required bool isTablet}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo
        _buildLogo(),

        // Navigation Links - Centered
        Flexible(
          flex: 2,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 450 : 600,
            ),
            child: isTablet
                ? _buildTabletNavLinks()
                : _buildDesktopNavLinks(),
          ),
        ),

        // Get A Quote Button
        _buildQuoteButton(isTablet: isTablet),
      ],
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.local_shipping_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "Logistics",
          style: GoogleFonts.poppins(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFFF4800),
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopNavLinks() {
    final navItems = ['Home', 'Company', 'Tracking', 'Services'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: navItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: _buildNavLink(item),
        );
      }).toList(),
    );
  }

//   Widget _buildDesktopNavLinks() {
//   final navItems = ['Home', 'Company', 'Tracking', 'Services', 'Blog'];

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: navItems.map((item) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 6),
//         child: _buildNavLink(
//           item,
//           onTap: () => widget.onNavigate(item),
//         ),
//       );
//     }).toList(),
//   );
// }

  Widget _buildTabletNavLinks() {
    final navItems = ['Home', 'Company', 'Tracking', 'Services'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: navItems.map((item) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: _buildNavLink(item, isTablet: true),
        );
      }).toList(),
    );
  }


//   Widget _buildTabletNavLinks() {
//   final navItems = ['Home', 'Company', 'Tracking', 'Services'];

//   return Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: navItems.map((item) {
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 4),
//         child: _buildNavLink(
//           item,
//           isTablet: true,
//           onTap: () => widget.onNavigate(item),
//         ),
//       );
//     }).toList(),
//   );
// }

  Widget _buildNavLink(String title, {bool isTablet = false}) {
    return InkWell(
      // onTap: () {
      //   // Handle navigation
      // },
      onTap: () => _navigateTo(title),
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 10 : 14,
          vertical: 8,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: isTablet ? 13 : 15,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF333333),
          ),
        ),
      ),
    );
  }


// Widget _buildNavLink(
//   String title, {
//   required VoidCallback onTap,
//   bool isTablet = false,
// }) {
//   return InkWell(
//     onTap: onTap,
//     borderRadius: BorderRadius.circular(6),
//     child: Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: isTablet ? 8 : 10,
//         vertical: 8,
//       ),
//       child: Text(
//         title,
//         style: GoogleFonts.poppins(
//           fontSize: isTablet ? 12 : 14,
//           fontWeight: FontWeight.w500,
//           color: const Color(0xFF333333),
//         ),
//       ),
//     ),
//   );
// }


  Widget _buildQuoteButton({required bool isTablet}) {
    return Container(
      height: isTablet ? 40 : 45,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 18 : 24,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        // onTap: () {
        //   // Handle quote
        // },

        // onTap: () => widget.onNavigate('Contact'),
        onTap: () => _navigateTo('Get A Quote'),
        borderRadius: BorderRadius.circular(8),
        child: Center(
          child: Text(
            "Get A Quote",
            style: GoogleFonts.poppins(
              fontSize: isTablet ? 13 : 14,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// ===========================================================================
// RESPONSIVE EXTENSION (if not already defined)
// ===========================================================================

extension ResponsiveExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 1024;
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
  bool get isLargeDesktop => MediaQuery.of(this).size.width >= 1400;
}




///////////////////////////////////////////////////////////////
// class _SocialIcon extends StatelessWidget {
//   final IconData icon;
//   final String url;
//   final Color? color;

//   const _SocialIcon({required this.icon, required this.url, this.color});

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: FaIcon(icon, size: 15, color: color ?? Colors.white),
//       onPressed: () async {
//         // Navigator.of(context).push(
//         //   MaterialPageRoute(
//         //     builder: (context) => const HomePage(),
//         //   ),
//         // );
//         final uri = Uri.parse(url);
//         if (await canLaunchUrl(uri)) {
//           await launchUrl(uri, mode: LaunchMode.externalApplication);
//         }
//       },
//       tooltip: url,
//     );
//   }
// }
