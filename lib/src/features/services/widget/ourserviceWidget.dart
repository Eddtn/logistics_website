// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:google_fonts/google_fonts.dart';

// class OurServiceWidget extends StatefulWidget {
//   const OurServiceWidget({super.key});

//   @override
//   State<OurServiceWidget> createState() => _OurServiceWidgetState();
// }

// class _OurServiceWidgetState extends State<OurServiceWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     final bool isMobile = screenWidth <= 600;
//     final bool isTablet = screenWidth > 600 && screenWidth <= 1024;
//     final bool isDesktop = screenWidth > 1024;

//     return Container(
//       width: double.infinity,
//       color: isMobile ? const Color(0xFFF5F7FB) : Colors.transparent,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : isTablet ? 32 : 40,
//         vertical: isMobile ? 24 : isTablet ? 32 : 40,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Section Header
//           _buildSectionHeader(context, isMobile),

//            SizedBox(height: isMobile ? 16 : 24),

//           // Service Cards
//           isDesktop
//               ? _buildDesktopServices(context)
//               : isTablet
//                   ? _buildTabletServices(context)
//                   : _buildMobileServices(context),
//         ],
//       ),
//     );
//   }

//   // ===========================================================================
//   // SECTION HEADER
//   // ===========================================================================

//   Widget _buildSectionHeader(BuildContext context, bool isMobile) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           "OUR SERVICES",
//           style: GoogleFonts.poppins(
//             fontSize: isMobile ? 16 : 18,
//             fontWeight: FontWeight.w600,
//             color: const Color(0xFFFF4800),
//             letterSpacing: 2,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Text(
//           "Best Logistics Services",
//           style: GoogleFonts.poppins(
//             fontSize: isMobile ? 24 : 32,
//             fontWeight: FontWeight.w700,
//             color: const Color(0xFF1A1A2E),
//             letterSpacing: -0.5,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: isMobile ? 40 : 60,
//           height: 3,
//           decoration: BoxDecoration(
//             gradient: const LinearGradient(
//               colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
//             ),
//             borderRadius: BorderRadius.circular(2),
//           ),
//         ),
//       ],
//     );
//   }

//   // ===========================================================================
//   // DESKTOP SERVICES (4 cards in a row)
//   // ===========================================================================

//   Widget _buildDesktopServices(BuildContext context) {
//     final services = _getServicesData();

//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final maxWidth = constraints.maxWidth;
//         final cardWidth = (maxWidth - 60) / 4; // 3 gaps of 20px

//         return Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: services.map((service) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               child: SizedBox(
//                 width: cardWidth.clamp(200, 300),
//                 child: _ServiceCard(
//                   icon: service.icon,
//                   title: service.title,
//                   description: service.description,
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }

//   // ===========================================================================
//   // TABLET SERVICES (2x2 grid)
//   // ===========================================================================

//   Widget _buildTabletServices(BuildContext context) {
//     final services = _getServicesData();
//     final screenHeight = MediaQuery.of(context).size.height;

//     return SizedBox(
//       height: screenHeight * 0.55,
//       child: GridView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 1.1,
//         ),
//         itemCount: services.length,
//         itemBuilder: (context, index) {
//           return _ServiceCard(
//             icon: services[index].icon,
//             title: services[index].title,
//             description: services[index].description,
//           );
//         },
//       ),
//     );
//   }

//   // ===========================================================================
//   // MOBILE SERVICES (Vertical list)
//   // ===========================================================================

//   Widget _buildMobileServices(BuildContext context) {
//     final services = _getServicesData();

//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: services.length,
//       itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 16),
//           child: _ServiceCard(
//             icon: services[index].icon,
//             title: services[index].title,
//             description: services[index].description,
//             isMobile: true,
//           ),
//         );
//       },
//     );
//   }

//   // ===========================================================================
//   // SERVICES DATA
//   // ===========================================================================

//   List<_ServiceData> _getServicesData() {
//     return [
//       _ServiceData(
//         icon: Icons.airplanemode_active_outlined,
//         title: "Air Freight",
//         description:
//             "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
//       ),
//       _ServiceData(
//         icon: Icons.local_shipping_outlined,
//         title: "Ocean Freight",
//         description:
//             "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
//       ),
//       _ServiceData(
//         icon: Icons.fire_truck_sharp,
//         title: "Land Transport",
//         description:
//             "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
//       ),
//       _ServiceData(
//         icon: Icons.storefront_sharp,
//         title: "Cargo Storage",
//         description:
//             "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
//       ),
//     ];
//   }
// }

// // ===========================================================================
// // SERVICE DATA CLASS
// // ===========================================================================

// class _ServiceData {
//   final IconData icon;
//   final String title;
//   final String description;

//   _ServiceData({
//     required this.icon,
//     required this.title,
//     required this.description,
//   });
// }

// // ===========================================================================
// // SERVICE CARD
// // ===========================================================================

// class _ServiceCard extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String description;
//   final bool isMobile;

//   const _ServiceCard({
//     required this.icon,
//     required this.title,
//     required this.description,
//     this.isMobile = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return Container(
//       decoration: BoxDecoration(
//         color: isDark ? const Color(0xFF1A1A2E) : Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//         border: Border.all(
//           color: isDark
//               ? Colors.white.withOpacity(0.05)
//               : const Color(0xFFE8ECF2),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Icon & Title Header
//           Container(
//             padding: EdgeInsets.all(isMobile ? 16 : 20),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: BoxDecoration(
//                     color: Colors.white.withOpacity(0.2),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Icon(
//                     icon,
//                     color: Colors.white,
//                     size: isMobile ? 20 : 24,
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: GoogleFonts.poppins(
//                       fontSize: isMobile ? 16 : 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Description
//           Padding(
//             padding: EdgeInsets.all(isMobile ? 16 : 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   description,
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 13 : 14,
//                     fontWeight: FontWeight.w400,
//                     color: isDark
//                         ? Colors.white.withOpacity(0.7)
//                         : const Color(0xFF4A4A6A),
//                     height: 1.6,
//                   ),
//                   maxLines: isMobile ? 3 : 4,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 16),

//                 // Read More
//                 InkWell(
//                   onTap: () {
//                     // Handle read more
//                   },
//                   borderRadius: BorderRadius.circular(8),
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFFF4800).withOpacity(0.08),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           "Read More",
//                           style: GoogleFonts.poppins(
//                             fontSize: 13,
//                             fontWeight: FontWeight.w600,
//                             color: const Color(0xFFFF4800),
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         Icon(
//                           Icons.arrow_forward_rounded,
//                           size: 14,
//                           color: const Color(0xFFFF4800),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ===========================================================================
// // ALTERNATIVE: SIMPLIFIED VERSION WITHOUT CUSTOM CARDS
// // ===========================================================================

// class SimplifiedOurServiceWidget extends StatelessWidget {
//   const SimplifiedOurServiceWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//     final isTablet = screenWidth >= 600 && screenWidth < 1024;

//     final services = [
//       {
//         'icon': Icons.airplanemode_active_outlined,
//         'title': 'Air Freight',
//         'desc':
//             'Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam',
//       },
//       {
//         'icon': Icons.local_shipping_outlined,
//         'title': 'Ocean Freight',
//         'desc':
//             'Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam',
//       },
//       {
//         'icon': Icons.fire_truck_sharp,
//         'title': 'Land Transport',
//         'desc':
//             'Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam',
//       },
//       {
//         'icon': Icons.storefront_sharp,
//         'title': 'Cargo Storage',
//         'desc':
//             'Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam',
//       },
//     ];

//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 32,
//         vertical: isMobile ? 24 : 40,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // Header
//           Column(
//             children: [
//               Text(
//                 "OUR SERVICES",
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 16 : 18,
//                   fontWeight: FontWeight.w600,
//                   color: const Color(0xFFFF4800),
//                   letterSpacing: 2,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 "Best Logistics Services",
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 24 : 32,
//                   fontWeight: FontWeight.w700,
//                   color: const Color(0xFF1A1A2E),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 24),

//           // Services Grid or List
//           isMobile
//               ? _buildMobileServicesList(services)
//               : _buildServicesGrid(services, isTablet),
//         ],
//       ),
//     );
//   }

//   Widget _buildServicesGrid(List<Map<String, dynamic>> services, bool isTablet) {
//     return GridView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: isTablet ? 2 : 4,
//         crossAxisSpacing: 16,
//         mainAxisSpacing: 16,
//         childAspectRatio: 0.9,
//       ),
//       itemCount: services.length,
//       itemBuilder: (context, index) {
//         final service = services[index];
//         return _buildServiceCard(
//           icon: service['icon'] as IconData,
//           title: service['title'] as String,
//           desc: service['desc'] as String,
//         );
//       },
//     );
//   }

//   Widget _buildMobileServicesList(List<Map<String, dynamic>> services) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: services.length,
//       itemBuilder: (context, index) {
//         final service = services[index];
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 12),
//           child: _buildServiceCard(
//             icon: service['icon'] as IconData,
//             title: service['title'] as String,
//             desc: service['desc'] as String,
//             isMobile: true,
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildServiceCard({
//     required IconData icon,
//     required String title,
//     required String desc,
//     bool isMobile = false,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//         border: Border.all(
//           color: const Color(0xFFE8ECF2),
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Header with icon and title
//           Container(
//             padding: EdgeInsets.all(isMobile ? 16 : 20),
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(16),
//                 topRight: Radius.circular(16),
//               ),
//             ),
//             child: Row(
//               children: [
//                 Icon(icon, color: Colors.white, size: isMobile ? 20 : 24),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Text(
//                     title,
//                     style: GoogleFonts.poppins(
//                       fontSize: isMobile ? 16 : 18,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Body
//           Padding(
//             padding: EdgeInsets.all(isMobile ? 16 : 20),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   desc,
//                   style: GoogleFonts.poppins(
//                     fontSize: isMobile ? 13 : 14,
//                     color: const Color(0xFF4A4A6A),
//                     height: 1.6,
//                   ),
//                   maxLines: isMobile ? 2 : 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 12),
//                 InkWell(
//                   onTap: () {},
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         "Read More",
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w600,
//                           color: const Color(0xFFFF4800),
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       Icon(
//                         Icons.arrow_forward_rounded,
//                         size: 14,
//                         color: const Color(0xFFFF4800),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Responsive logistics services section.
///
/// This widget can be placed inside a page or inside a SingleChildScrollView.
/// It does not use fixed card heights or nested scrolling lists, helping avoid
/// common RenderFlex overflow errors when text wraps on smaller screens.
class OurServiceWidget extends StatelessWidget {
  const OurServiceWidget({super.key});

  static const Color _orange = Color(0xFFFF4800);
  static const Color _orangeLight = Color(0xFFFF6B35);
  static const Color _heading = Color(0xFF1A1A2E);
  static const Color _body = Color(0xFF4A4A6A);
  static const Color _sectionBackground = Color(0xFFF5F7FB);
  static const Color _border = Color(0xFFE8ECF2);

  static const List<_ServiceData> _services = [
    _ServiceData(
      icon: Icons.airplanemode_active_outlined,
      title: 'Air Freight',
      description:
          'Move time-sensitive shipments quickly with dependable air cargo solutions. We help businesses transport goods across borders efficiently, connect with global markets, and keep important deliveries moving.',
    ),
    _ServiceData(
      icon: Icons.directions_boat_outlined,
      title: 'Ocean Freight',
      description:
          'Ship large, heavy, and bulk cargo with practical ocean freight solutions. From containerized goods to international trade shipments, we help simplify cargo movement while supporting cost-conscious supply chains.',
    ),
    _ServiceData(
      icon: Icons.local_shipping_outlined,
      title: 'Land Transport',
      description:
          'Move goods between locations with reliable road transportation. We focus on careful cargo handling, dependable coordination, and efficient delivery from pickup to destination.',
    ),
    _ServiceData(
      icon: Icons.warehouse_outlined,
      title: 'Cargo Storage',
      description:
          'Keep goods organized and protected before they reach their destination. Our cargo storage solutions support easier inventory handling, accessible stock, and a smoother distribution process.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _sectionBackground,
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _ServicesHeader(
                eyebrow: 'OUR SERVICES',
                title: 'Logistics Solutions That Move Your Business Forward',
                description:
                    'From international freight to dependable road transport and cargo storage, we provide practical logistics solutions designed to keep your goods moving and your operations running smoothly.',
              ),
              const SizedBox(height: 32),
              LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final int columns = width >= 1050
                      ? 4
                      : width >= 620
                          ? 2
                          : 1;
                  const spacing = 20.0;
                  final cardWidth =
                      (width - (spacing * (columns - 1))) / columns;

                  return Wrap(
                    spacing: spacing,
                    runSpacing: spacing,
                    alignment: WrapAlignment.center,
                    children: _services
                        .map(
                          (service) => SizedBox(
                            width: cardWidth,
                            child: _ServiceCard(service: service),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServicesHeader extends StatelessWidget {
  const _ServicesHeader({
    required this.eyebrow,
    required this.title,
    required this.description,
  });

  final String eyebrow;
  final String title;
  final String description;

  static const Color _orange = Color(0xFFFF4800);
  static const Color _heading = Color(0xFF1A1A2E);
  static const Color _body = Color(0xFF4A4A6A);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          eyebrow,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: _orange,
            letterSpacing: 2.0,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 30,
            height: 1.25,
            fontWeight: FontWeight.w700,
            color: _heading,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 780),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 14,
              height: 1.75,
              color: _body,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          width: 58,
          height: 4,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF4800), Color(0xFFFF6B35)],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class _ServiceData {
  const _ServiceData({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;
}

class _ServiceCard extends StatelessWidget {
  const _ServiceCard({required this.service});

  final _ServiceData service;

  static const Color _orange = Color(0xFFFF4800);
  static const Color _orangeLight = Color(0xFFFF6B35);
  static const Color _heading = Color(0xFF1A1A2E);
  static const Color _body = Color(0xFF4A4A6A);
  static const Color _border = Color(0xFFE8ECF2);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1A1A2E) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.white12 : _border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.045),
            blurRadius: 18,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [_orange, _orangeLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    service.icon,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    service.title,
                    softWrap: true,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      height: 1.3,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              service.description,
              softWrap: true,
              style: GoogleFonts.poppins(
                fontSize: 13,
                height: 1.75,
                fontWeight: FontWeight.w400,
                color: isDark ? Colors.white70 : _body,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
