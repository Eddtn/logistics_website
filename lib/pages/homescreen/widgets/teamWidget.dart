import 'package:flutter/material.dart';

class HoverCardWithPeek extends StatefulWidget {
  final String imagePath;
  final String name;
  final String designation;
  double height;
  double width;

  HoverCardWithPeek({
    super.key,
    required this.imagePath,
    required this.name,
    required this.designation,
    required this.height,
    required this.width,
  });

  @override
  _HoverCardWithPeekState createState() => _HoverCardWithPeekState();
}

class _HoverCardWithPeekState extends State<HoverCardWithPeek> {
  bool _showOverlay = false;

  void _toggleOverlay(bool show) {
    setState(() {
      _showOverlay = show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

    final double peekHeight = 5;
    final double fullHeight = screenHeight * 0.2;

    return Center(
      child: MouseRegion(
        onEnter: (_) => _toggleOverlay(true),
        onExit: (_) => _toggleOverlay(false),
        child: GestureDetector(
          onTap: () => _toggleOverlay(!_showOverlay),
          child: Container(
            height: screenHeight * 0.6,
            width: isDesktop ? screenWidth * 0.2 : screenWidth * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
            ),
            child: Stack(
              children: [
                // Image + Name
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: isDesktop
                          ? screenHeight * 0.4
                          : screenHeight * 0.6,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.designation,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Bottom overlay (with peek)
                AnimatedPositioned(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  bottom: _showOverlay ? 0 : -(fullHeight - peekHeight),
                  left: 0,
                  right: 0,
                  child: Container(
                    height: fullHeight,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF4800),
                      // borderRadius: BorderRadius.vertical(
                      //   top: Radius.circular(10),
                      // ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Connect with me",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, color: Colors.white),
                            SizedBox(width: 12),
                            Icon(Icons.email, color: Colors.white),
                            SizedBox(width: 12),
                            Icon(Icons.phone, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class HoverCardWithPeek extends StatefulWidget {
//   final String imagePath;
//   final String name;
//   final String designation;

//   const HoverCardWithPeek({
//     super.key,
//     required this.imagePath,
//     required this.name,
//     required this.designation,
//   });

//   @override
//   State<HoverCardWithPeek> createState() => _HoverCardWithPeekState();
// }

// class _HoverCardWithPeekState extends State<HoverCardWithPeek> {
//   bool _showOverlay = false;

//   void _toggleOverlay(bool show) {
//     setState(() {
//       _showOverlay = show;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         double screenWidth = constraints.maxWidth;
//         double screenHeight = constraints.maxHeight;

//         final bool isMobile = screenWidth <= 600;
//         final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
//         final bool isDesktop = screenWidth > 1000;

//         // Responsive sizes
//         final cardWidth = screenWidth * 0.2;

//         // isMobile
//         //     ? screenWidth * 0.9
//         //     : isTablet
//         //     ? screenWidth * 0.4
//         //     : screenWidth * 0.2;

//         final cardHeight = screenHeight * 0.6;

//         //  isMobile
//         //     ? screenHeight * 0.5
//         //     : isTablet
//         //     ? screenHeight * 0.55
//         //     : screenHeight * 0.6;

//         final imageHeight = cardHeight * 0.5;
//         final peekHeight = 6;
//         final fullOverlayHeight = cardHeight * 0.35;

//         final nameFontSize = isMobile ? 16.0 : 18.0;
//         final designationFontSize = isMobile ? 12.0 : 14.0;

//         return Center(
//           child: MouseRegion(
//             onEnter: (_) => _toggleOverlay(true),
//             onExit: (_) => _toggleOverlay(false),
//             child: GestureDetector(
//               onTap: () => _toggleOverlay(!_showOverlay),
//               child: Container(
//                 height: cardHeight,
//                 width: cardWidth,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//                 ),
//                 child: Stack(
//                   children: [
//                     // Main content
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Container(
//                           height: imageHeight,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(widget.imagePath),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Column(
//                             children: [
//                               Text(
//                                 widget.name,
//                                 style: TextStyle(
//                                   fontSize: nameFontSize,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 widget.designation,
//                                 style: TextStyle(
//                                   fontSize: designationFontSize,
//                                   color: Colors.grey[600],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Bottom overlay (with peek)
//                     AnimatedPositioned(
//                       duration: const Duration(milliseconds: 400),
//                       curve: Curves.easeOut,
//                       bottom: _showOverlay
//                           ? 0
//                           : -(fullOverlayHeight - peekHeight),
//                       left: 0,
//                       right: 0,
//                       child: Container(
//                         height: fullOverlayHeight,
//                         padding: const EdgeInsets.all(16),
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFFF4800),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Text(
//                               "Connect with me",
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: isMobile ? 14 : 16,
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: const [
//                                 Icon(Icons.facebook, color: Colors.white),
//                                 SizedBox(width: 12),
//                                 Icon(Icons.email, color: Colors.white),
//                                 SizedBox(width: 12),
//                                 Icon(Icons.phone, color: Colors.white),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
