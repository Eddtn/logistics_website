// import 'package:flutter/material.dart';

// class HoverCardWithPeek extends StatefulWidget {
//   final String imagePath;
//   final String name;
//   final String designation;
//   // double height;
//   // double width;

//   HoverCardWithPeek({
//     super.key,
//     required this.imagePath,
//     required this.name,
//     required this.designation,
//     // required this.height,
//     // required this.width,
//   });

//   @override
//   _HoverCardWithPeekState createState() => _HoverCardWithPeekState();
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
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     final bool isMobile = screenWidth <= 600;
//     final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
//     final bool isDesktop = screenWidth > 1000;

//     final double peekHeight = 5;
//     final double fullHeight = isDesktop
//         ? screenHeight * 0.2
//         : screenHeight * 0.15;

//     return Center(
//       child: MouseRegion(
//         onEnter: (_) => _toggleOverlay(true),
//         onExit: (_) => _toggleOverlay(false),
//         child: GestureDetector(
//           onTap: () => _toggleOverlay(!_showOverlay),
//           child: Container(
//             height: isDesktop ? screenHeight * 0.6 : screenHeight * 0.95,
//             width: isDesktop ? screenWidth * 0.2 : screenWidth * 0.9,
//             decoration: BoxDecoration(
//               color: Colors.green,

//               //  Colors.grey[200],
//               // boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//             ),
//             child: Stack(
//               children: [
//                 // Image + Name
//                 Column(
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Container(
//                       height: isDesktop
//                           ? screenHeight * 0.4
//                           : screenHeight * 0.8,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(widget.imagePath),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),

//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: Column(
//                         children: [
//                           Text(
//                             widget.name,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Text(
//                             widget.designation,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.grey[600],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),

//                 // Bottom overlay (with peek)
//                 AnimatedPositioned(
//                   duration: Duration(milliseconds: 400),
//                   curve: Curves.easeOut,
//                   bottom: _showOverlay ? 0 : -(fullHeight - peekHeight),
//                   left: 0,
//                   right: 0,
//                   child: Container(
//                     height: fullHeight,
//                     decoration: BoxDecoration(
//                       color: Color(0xFFFF4800),
//                       // borderRadius: BorderRadius.vertical(
//                       //   top: Radius.circular(10),
//                       // ),
//                     ),
//                         padding: const EdgeInsets.symmetric(
// horizontal: 16,
//   vertical: 12,
// ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Text(
//                           "Connect with me",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(Icons.facebook, color: Colors.white),
//                             SizedBox(width: 12),
//                             Icon(Icons.email, color: Colors.white),
//                             SizedBox(width: 12),
//                             Icon(Icons.phone, color: Colors.white),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:logistics_website/onstants/customIcons.dart';
import 'package:logistics_website/onstants/deliveryIcon.dart';

class HoverCardWithPeek extends StatefulWidget {
  final String imagePath;
  final String name;
  final String designation;

  const HoverCardWithPeek({
    super.key,
    required this.imagePath,
    required this.name,
    required this.designation,
  });

  @override
  State<HoverCardWithPeek> createState() => _HoverCardWithPeekState();
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
    return MouseRegion(
      onEnter: (_) => _toggleOverlay(true),
      onExit: (_) => _toggleOverlay(false),
      child: GestureDetector(
        onTap: () => _toggleOverlay(!_showOverlay),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double imageHeight = constraints.maxHeight * 0.7;

              //  constraints.maxHeight * 0.8;
              final double overlayHeight = constraints.maxHeight * 0.3;
              final double peekHeight = 5;

              return Stack(
                children: [
                  // Main content
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: imageHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(widget.imagePath),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Text(
                              widget.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.designation,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Peek overlay
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeOut,
                    bottom: _showOverlay ? 0 : -(overlayHeight - peekHeight),
                    left: 0,
                    right: 0,
                    child: Container(
                      height: overlayHeight,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: const BoxDecoration(color: Color(0xFFFF4800)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          // MyPage(shouldEnableHover: true),
                          DelIconWidget(shouldEnableHover: true),
                          // Text(
                          //   "Connect with me",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 16,
                          //   ),
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Icon(Icons.facebook, color: Colors.white),
                          //     SizedBox(width: 12),
                          //     Icon(Icons.email, color: Colors.white),
                          //     SizedBox(width: 12),
                          //     Icon(Icons.phone, color: Colors.white),
                          //   ],
                          // ),
                        ],
                      ),
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
//         final double cardWidth = constraints.maxWidth;
//         final double cardHeight = constraints.maxHeight;

//         final bool isMobile = cardWidth < 600;
//         final bool isTablet = cardWidth >= 600 && cardWidth <= 1000;

//         final double imageHeight = cardHeight * 0.55;
//         final double peekHeight = 6;
//         final double fullOverlayHeight = cardHeight * 0.3;

//         return MouseRegion(
//           onEnter: (_) => _toggleOverlay(true),
//           onExit: (_) => _toggleOverlay(false),
//           child: GestureDetector(
//             onTap: () => _toggleOverlay(!_showOverlay),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
//               ),
//               child: Stack(
//                 children: [
//                   // Main content
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       Container(
//                         height: imageHeight,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(widget.imagePath),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Column(
//                           children: [
//                             Text(
//                               widget.name,
//                               style: TextStyle(
//                                 fontSize: isMobile ? 16 : 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             SizedBox(height: 4),
//                             Text(
//                               widget.designation,
//                               style: TextStyle(
//                                 fontSize: isMobile ? 12 : 14,
//                                 color: Colors.grey[600],
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),

//                   // Overlay
//                   AnimatedPositioned(
//                     duration: Duration(milliseconds: 400),
//                     curve: Curves.easeOut,
//                     bottom: _showOverlay
//                         ? 0
//                         : -(fullOverlayHeight - peekHeight),
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       height: fullOverlayHeight,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 16,
//                         vertical: 12,
//                       ),
//                       decoration: BoxDecoration(color: Color(0xFFFF4800)),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text(
//                             "Connect with me",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: isMobile ? 14 : 16,
//                             ),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: const [
//                               Icon(Icons.facebook, color: Colors.white),
//                               SizedBox(width: 12),
//                               Icon(Icons.email, color: Colors.white),
//                               SizedBox(width: 12),
//                               Icon(Icons.phone, color: Colors.white),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
