// // import 'package:flutter/material.dart';
// // import 'package:google_fonts/google_fonts.dart';
// // import 'package:logistics_website/onstants/appbar.dart';
// // import 'package:logistics_website/onstants/floatingWidget.dart';
// // import 'package:logistics_website/onstants/footer.dart';
// // import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';
// // import 'package:logistics_website/src/features/homescreen/widgets/testimonialWidget.dart';
// // import 'package:logistics_website/src/features/price/widget/getaquotewidget.dart';
// // import 'package:logistics_website/src/features/price/widget/pricing.dart';
// // import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
// // import 'package:logistics_website/src/features/services/widget/ourserviceWidget.dart';
// // import 'package:logistics_website/src/features/services/widget/serviceWidget.dart';

// // class ServicePageScreen extends StatefulWidget {
// //   const ServicePageScreen({super.key});

// //   @override
// //   State<ServicePageScreen> createState() => _ServicePageScreenState();
// // }

// // class _ServicePageScreenState extends State<ServicePageScreen> {
// //   final ScrollController _scrollController = ScrollController();
// //   bool _showFab = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _scrollController.addListener(_scrollListener);

// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       final screenSize = MediaQuery.of(context).size;
// //       print('Screen width: ${screenSize.width}, height: ${screenSize.height}');
// //     });
// //   }

// //   void _scrollListener() {
// //     if (_scrollController.offset > 200 && !_showFab) {
// //       setState(() => _showFab = true);
// //     } else if (_scrollController.offset <= 200 && _showFab) {
// //       setState(() => _showFab = false);
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _scrollController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SingleChildScrollView(
// //         controller: _scrollController,
// //         child: Column(
// //           children: [
// //             AppBarWidget(),

// //             firsthomePage(
// //               height: 350,
// //               child: Column(
// //                 // mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.center,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     "Service",
// //                     style: GoogleFonts.poppins(
// //                       fontSize: 50,
// //                       fontWeight: FontWeight.w900,
// //                       color: Colors.white,
// //                     ),
// //                   ),
// //                   SizedBox(height: 20),
// //                   Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         "Home",
// //                         style: GoogleFonts.poppins(
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.w900,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                       SizedBox(width: 10),
// //                       Icon(Icons.circle_sharp, color: Colors.white, size: 15),
// //                       SizedBox(width: 10),

// //                       Text(
// //                         "Service",
// //                         style: GoogleFonts.poppins(
// //                           fontSize: 15,
// //                           fontWeight: FontWeight.w900,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   // Spacer(),
// //                 ],
// //               ),
// //             ),
// //             OurServiceWidget(),
// //             RequestQuoteWidget(),
// //             SizedBox(height: 20),
// //             TestimonySection(),
// //             FooterPage(),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingWidget(controller: _scrollController),
// //     );
// //   }
// // }





// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:logistics_website/onstants/appbar.dart';
// import 'package:logistics_website/onstants/floatingWidget.dart';
// import 'package:logistics_website/onstants/footer.dart';
// import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';
// import 'package:logistics_website/src/features/homescreen/widgets/testimonialWidget.dart';
// import 'package:logistics_website/src/features/price/widget/getaquotewidget.dart';
// import 'package:logistics_website/src/features/price/widget/pricing.dart';
// import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
// import 'package:logistics_website/src/features/services/widget/ourserviceWidget.dart';
// import 'package:logistics_website/src/features/services/widget/serviceWidget.dart';

// class ServicePageScreen extends StatefulWidget {
//   const ServicePageScreen({super.key});

//   @override
//   State<ServicePageScreen> createState() => _ServicePageScreenState();
// }

// class _ServicePageScreenState extends State<ServicePageScreen>
//     with SingleTickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();
//   late final AnimationController _fadeController;
//   bool _showFab = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
    
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     )..forward();

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final screenSize = MediaQuery.of(context).size;
//       debugPrint('Screen width: ${screenSize.width}, height: ${screenSize.height}');
//     });
//   }

//   void _scrollListener() {
//     if (_scrollController.offset > 200 && !_showFab) {
//       setState(() => _showFab = true);
//     } else if (_scrollController.offset <= 200 && _showFab) {
//       setState(() => _showFab = false);
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//     final isTablet = screenWidth >= 600 && screenWidth < 1024;

//     return Scaffold(
//       body: FadeTransition(
//         opacity: _fadeController,
//         child: SingleChildScrollView(
//           controller: _scrollController,
//           physics: const BouncingScrollPhysics(),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // App Bar
//               const AppBarWidget(),

//               // Hero Section
//               firsthomePage(
//                 height: isMobile ? 280 : 350,
//                 child: _buildHeroSection(context, isMobile, isTablet),
//               ),

//               // Our Services
//               const OurServiceWidget(),

//               // Request Quote
//               const RequestQuoteWidget(),

//               const SizedBox(height: 20),

//               // Testimonials
//               const TestimonySection(),

//               // Footer
//               const FooterPage(),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingWidget(controller: _scrollController),
//     );
//   }

//   // ===========================================================================
//   // HERO SECTION
//   // ===========================================================================

//   Widget _buildHeroSection(
//     BuildContext context,
//     bool isMobile,
//     bool isTablet,
//   ) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 32,
//         vertical: isMobile ? 8 : 16,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Main Title
//           Text(
//             "Services",
//             style: GoogleFonts.poppins(
//               fontSize: isMobile ? 36 : 50,
//               fontWeight: FontWeight.w900,
//               color: Colors.white,
//               letterSpacing: -1,
//             ),
//           ),
          
//           SizedBox(height: isMobile ? 12 : 20),

//           // Breadcrumb
//           _buildBreadcrumb(context, isMobile),
//         ],
//       ),
//     );
//   }

//   // ===========================================================================
//   // BREADCRUMB
//   // ===========================================================================

//   Widget _buildBreadcrumb(BuildContext context, bool isMobile) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 12 : 16,
//         vertical: isMobile ? 6 : 8,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.2),
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Home
//           InkWell(
//             onTap: () {
//               // Navigate to home
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 8,
//                 vertical: 4,
//               ),
//               child: Text(
//                 "Home",
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 12 : 15,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
          
//           // Separator
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Icon(
//               Icons.circle_sharp,
//               color: Colors.white.withOpacity(0.5),
//               size: isMobile ? 6 : 8,
//             ),
//           ),
          
//           // Services (Active)
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8,
//               vertical: 4,
//             ),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFF4800).withOpacity(0.2),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               "Services",
//               style: GoogleFonts.poppins(
//                 fontSize: isMobile ? 12 : 15,
//                 fontWeight: FontWeight.w700,
//                 color: const Color(0xFFFF4800),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ===========================================================================
// // OPTIONAL: RESPONSIVE SERVICE PAGE WITH BETTER LAYOUT
// // ===========================================================================

// class ResponsiveServicePageScreen extends StatefulWidget {
//   const ResponsiveServicePageScreen({super.key});

//   @override
//   State<ResponsiveServicePageScreen> createState() =>
//       _ResponsiveServicePageScreenState();
// }

// class _ResponsiveServicePageScreenState
//     extends State<ResponsiveServicePageScreen>
//     with SingleTickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();
//   late final AnimationController _fadeController;
//   bool _showFab = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController.addListener(_scrollListener);
    
//     _fadeController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 600),
//     )..forward();
//   }

//   void _scrollListener() {
//     if (_scrollController.offset > 200 && !_showFab) {
//       setState(() => _showFab = true);
//     } else if (_scrollController.offset <= 200 && _showFab) {
//       setState(() => _showFab = false);
//     }
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _fadeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isMobile = screenWidth < 600;
//     final isTablet = screenWidth >= 600 && screenWidth < 1024;

//     return Scaffold(
//       body: FadeTransition(
//         opacity: _fadeController,
//         child: CustomScrollView(
//           controller: _scrollController,
//           physics: const BouncingScrollPhysics(),
//           slivers: [
//             // App Bar
//             const SliverToBoxAdapter(
//               child: AppBarWidget(),
//             ),

//             // Hero Section
//             SliverToBoxAdapter(
//               child: firsthomePage(
//                 height: isMobile ? 280 : 350,
//                 child: _buildHeroSection(context, isMobile, isTablet),
//               ),
//             ),

//             // Our Services
//             const SliverToBoxAdapter(
//               child: OurServiceWidget(),
//             ),

//             // Request Quote
//             const SliverToBoxAdapter(
//               child: RequestQuoteWidget(),
//             ),

//             const SliverToBoxAdapter(
//               child: SizedBox(height: 20),
//             ),

//             // Testimonials
//             const SliverToBoxAdapter(
//               child: TestimonySection(),
//             ),

//             // Footer
//             const SliverToBoxAdapter(
//               child: FooterPage(),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingWidget(controller: _scrollController),
//     );
//   }

//   Widget _buildHeroSection(
//     BuildContext context,
//     bool isMobile,
//     bool isTablet,
//   ) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 16 : 32,
//         vertical: isMobile ? 8 : 16,
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Main Title
//           Text(
//             "Our Services",
//             style: GoogleFonts.poppins(
//               fontSize: isMobile ? 36 : 50,
//               fontWeight: FontWeight.w900,
//               color: Colors.white,
//               letterSpacing: -1,
//             ),
//           ),
          
//           const SizedBox(height: 8),

//           // Subtitle
//           if (!isMobile)
//             Text(
//               "Comprehensive logistics solutions tailored to your needs",
//               style: GoogleFonts.poppins(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w400,
//                 color: Colors.white.withOpacity(0.8),
//               ),
//             ),
          
//           SizedBox(height: isMobile ? 12 : 20),

//           // Breadcrumb
//           _buildBreadcrumb(context, isMobile),
//         ],
//       ),
//     );
//   }

//   Widget _buildBreadcrumb(BuildContext context, bool isMobile) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: isMobile ? 12 : 16,
//         vertical: isMobile ? 6 : 8,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.2),
//         ),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Home
//           InkWell(
//             onTap: () {
//               // Navigate to home
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 8,
//                 vertical: 4,
//               ),
//               child: Text(
//                 "Home",
//                 style: GoogleFonts.poppins(
//                   fontSize: isMobile ? 12 : 15,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
          
//           // Separator
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Icon(
//               Icons.circle_sharp,
//               color: Colors.white.withOpacity(0.5),
//               size: isMobile ? 6 : 8,
//             ),
//           ),
          
//           // Services (Active)
//           Container(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 8,
//               vertical: 4,
//             ),
//             decoration: BoxDecoration(
//               color: const Color(0xFFFF4800).withOpacity(0.2),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Text(
//               "Services",
//               style: GoogleFonts.poppins(
//                 fontSize: isMobile ? 12 : 15,
//                 fontWeight: FontWeight.w700,
//                 color: const Color(0xFFFF4800),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:logistics_website/onstants/floatingWidget.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';
import 'package:logistics_website/src/features/homescreen/widgets/testimonialWidget.dart';
import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
import 'package:logistics_website/src/features/services/widget/ourserviceWidget.dart';

class ServicePageScreen extends StatefulWidget {
  const ServicePageScreen({super.key});

  @override
  State<ServicePageScreen> createState() => _ServicePageScreenState();
}

class _ServicePageScreenState extends State<ServicePageScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _fadeController;
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      debugPrint('Screen width: ${screenSize.width}, height: ${screenSize.height}');
    });
  }

  void _scrollListener() {
    if (_scrollController.offset > 200 && !_showFab) {
      setState(() => _showFab = true);
    } else if (_scrollController.offset <= 200 && _showFab) {
      setState(() => _showFab = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      body: FadeTransition(
        opacity: _fadeController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App Bar
               AppBarWidget(onNavigate: (String value) {  },),

              // Hero Section
              HeroSectionWidget(
                height: isMobile ? 280 : 350,
                child: _buildHeroSection(context, isMobile, isTablet),
              ),

              // Our Services
              const OurServiceWidget(),

              // Request Quote
              const RequestQuoteWidget(),

              const SizedBox(height: 20),

              // Testimonials
              const TestimonySection(),

              // Footer
              const FooterPage(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingWidget(controller: _scrollController),
    );
  }

  // ===========================================================================
  // HERO SECTION
  // ===========================================================================

  Widget _buildHeroSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 8 : 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Title
          Text(
            "Services",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 36 : 50,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          
          SizedBox(height: isMobile ? 12 : 20),

          // Breadcrumb
          _buildBreadcrumb(context, isMobile),
        ],
      ),
    );
  }

  // ===========================================================================
  // BREADCRUMB
  // ===========================================================================

  Widget _buildBreadcrumb(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Home
          InkWell(
            onTap: () {
              // Navigate to home
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text(
                "Home",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 12 : 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // Separator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              Icons.circle_sharp,
              color: Colors.white.withValues(alpha: 0.5),
              size: isMobile ? 6 : 8,
            ),
          ),
          
          // Services (Active)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4800).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Services",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 12 : 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFF4800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// OPTIONAL: RESPONSIVE SERVICE PAGE WITH BETTER LAYOUT
// ===========================================================================

class ResponsiveServicePageScreen extends StatefulWidget {
  const ResponsiveServicePageScreen({super.key});

  @override
  State<ResponsiveServicePageScreen> createState() =>
      _ResponsiveServicePageScreenState();
}

class _ResponsiveServicePageScreenState
    extends State<ResponsiveServicePageScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _fadeController;
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();
  }

  void _scrollListener() {
    if (_scrollController.offset > 200 && !_showFab) {
      setState(() => _showFab = true);
    } else if (_scrollController.offset <= 200 && _showFab) {
      setState(() => _showFab = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1024;

    return Scaffold(
      body: FadeTransition(
        opacity: _fadeController,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            // App Bar
             SliverToBoxAdapter(
              child: AppBarWidget(onNavigate: (String value) {  },),
            ),

            // Hero Section
            SliverToBoxAdapter(
              child: HeroSectionWidget(
                height: isMobile ? 280 : 350,
                child: _buildHeroSection(context, isMobile, isTablet),
              ),
            ),

            // Our Services
            const SliverToBoxAdapter(
              child: OurServiceWidget(),
            ),

            // Request Quote
            const SliverToBoxAdapter(
              child: RequestQuoteWidget(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),

            // Testimonials
            const SliverToBoxAdapter(
              child: TestimonySection(),
            ),

            // Footer
            const SliverToBoxAdapter(
              child: FooterPage(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingWidget(controller: _scrollController),
    );
  }

  Widget _buildHeroSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: isMobile ? 8 : 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Main Title
          Text(
            "Our Services",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 36 : 50,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          
          const SizedBox(height: 8),

          // Subtitle
          if (!isMobile)
            Text(
              "Comprehensive logistics solutions tailored to your needs",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          
          SizedBox(height: isMobile ? 12 : 20),

          // Breadcrumb
          _buildBreadcrumb(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildBreadcrumb(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 6 : 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Home
          InkWell(
            onTap: () {
              // Navigate to home
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              child: Text(
                "Home",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 12 : 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          
          // Separator
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              Icons.circle_sharp,
              color: Colors.white.withValues(alpha: 0.5),
              size: isMobile ? 6 : 8,
            ),
          ),
          
          // Services (Active)
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFF4800).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Services",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 12 : 15,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFF4800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}