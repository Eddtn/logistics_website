// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class BlogSection extends StatefulWidget {
//   const BlogSection({super.key});

//   @override
//   State<BlogSection> createState() => _BlogSectionState();
// }

// class _BlogSectionState extends State<BlogSection> {
//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final screenWidth = MediaQuery.of(context).size.width;
//         final screenHeight = MediaQuery.of(context).size.height;

//         final bool isMobile = screenWidth <= 900;
//         // final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
//         // final bool isDesktop = screenWidth > 1000;

//         return isMobile
//             ? Container(
//                 margin: EdgeInsets.only(top: 30, left: 30, right: 30),
//                 // padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     Text(
//                       "OUR BLOG",
//                       style: TextStyle(
//                         color: Color(0xFFFF4800),
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Latest From Blog",
//                       style: GoogleFonts.poppins(
//                         fontSize: 35,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Stack(
//                       children: [
//                         Container(
//                           height: screenHeight * 1.0,
//                           width: screenWidth * 0.9,
//                           color: Color(0xffF2F2F4),
//                           child: Column(
//                             // mainAxisAlignment:
//                             //     MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 height: screenHeight * 0.50,
//                                 width: screenWidth * 0.9,
//                                 // color: Color(0xFFFF4800),
//                                 child: Image.asset(
//                                   'assets/images/blog-1.jpg',
//                                   width: double.infinity,
//                                   // height: 250,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.all(28.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 24,
//                                           backgroundImage: NetworkImage(
//                                             'assets/images/user.jpg',
//                                           ),
//                                         ),
//                                         SizedBox(width: 15),

//                                         Text(
//                                           "John Doe",
//                                           style: GoogleFonts.aboreto(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                         SizedBox(width: 15),
//                                         Icon(
//                                           Icons.bookmark_border_sharp,
//                                           color: Color(0xFFFF4800),
//                                         ),
//                                         Text(
//                                           "Web Design",
//                                           style: GoogleFonts.poppins(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 15),
//                                     Text(
//                                       "Kasd tempor diam sea justo dolor",
//                                       style: GoogleFonts.mochiyPopOne(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     SizedBox(height: 15),
//                                     Text(
//                                       "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                                     ),
//                                     SizedBox(height: 15),

//                                     Row(
//                                       children: [
//                                         Text(
//                                           "READ MORE",
//                                           style: GoogleFonts.aboreto(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xFFFF4800),
//                                           ),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Icon(
//                                           Icons.arrow_forward_ios_outlined,
//                                           size: 13,
//                                           color: Color(0xFFFF4800),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 260,
//                           right: 20,

//                           child: CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.red,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "01",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Text(
//                                     "JAN",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(width: 20),
//                     Stack(
//                       children: [
//                         Container(
//                           height: screenHeight * 1.0,
//                           width: screenWidth * 0.9,
//                           color: Color(0xffF2F2F4),
//                           child: Column(
//                             // mainAxisAlignment:
//                             //     MainAxisAlignment.spaceAround,
//                             children: [
//                               Container(
//                                 height: screenHeight * 0.50,
//                                 width: screenWidth * 0.9,
//                                 // color: Color(0xFFFF4800),
//                                 child: Image.asset(
//                                   'assets/images/blog-2.jpg',
//                                   width: double.infinity,
//                                   // height: 250,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),

//                               Padding(
//                                 padding: const EdgeInsets.all(28.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         CircleAvatar(
//                                           radius: 24,
//                                           backgroundImage: NetworkImage(
//                                             'assets/images/user.jpg',
//                                           ),
//                                         ),
//                                         SizedBox(width: 15),

//                                         Text(
//                                           "John Doe",
//                                           style: GoogleFonts.aboreto(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                         SizedBox(width: 15),
//                                         Icon(
//                                           Icons.bookmark_border_sharp,
//                                           color: Color(0xFFFF4800),
//                                         ),
//                                         Text(
//                                           "Web Design",
//                                           style: GoogleFonts.poppins(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(height: 15),
//                                     Text(
//                                       "Kasd tempor diam sea justo dolor",
//                                       style: GoogleFonts.mochiyPopOne(
//                                         fontSize: 25,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     SizedBox(height: 15),
//                                     Text(
//                                       "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                                     ),
//                                     SizedBox(height: 15),

//                                     Row(
//                                       children: [
//                                         Text(
//                                           "READ MORE",
//                                           style: GoogleFonts.aboreto(
//                                             // fontSize: 20,
//                                             fontWeight: FontWeight.bold,
//                                             color: Color(0xFFFF4800),
//                                           ),
//                                         ),
//                                         SizedBox(width: 5),
//                                         Icon(
//                                           Icons.arrow_forward_ios_outlined,
//                                           size: 13,
//                                           color: Color(0xFFFF4800),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Positioned(
//                           bottom: 260,
//                           right: 20,

//                           child: CircleAvatar(
//                             radius: 35,
//                             backgroundColor: Colors.red,
//                             child: Align(
//                               alignment: Alignment.center,
//                               child: Column(
//                                 children: [
//                                   Text(
//                                     "01",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black,
//                                     ),
//                                   ),
//                                   Text(
//                                     "JAN",
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//             // : isTablet
//             // ? Container(
//             //     height: screenHeight * 1.5,
//             //     margin: EdgeInsets.only(top: 30, left: 30, right: 30),
//             //     // padding: EdgeInsets.all(20),
//             //     child: Column(
//             //       children: [
//             //         Text(
//             //           "OUR BLOG",
//             //           style: TextStyle(
//             //             color: Color(0xFFFF4800),
//             //             fontSize: 15,
//             //             fontWeight: FontWeight.bold,
//             //           ),
//             //         ),
//             //         Text(
//             //           "Latest From Blog",
//             //           style: GoogleFonts.poppins(
//             //             fontSize: 35,
//             //             fontWeight: FontWeight.bold,
//             //             color: Colors.black,
//             //           ),
//             //         ),
//             //         Row(
//             //           children: [
//             //             BlogContainerwidget(
//             //               screenHeight: screenHeight,
//             //               screenWidth: screenWidth,
//             //               containerImage: 'assets/images/blog-1.jpg',
//             //               profileImage: 'assets/images/user.jpg',
//             //               name: 'John Doe',
//             //               jobTitle: "Web Design",
//             //               heading: "Kasd tempor diam sea justo dolor",
//             //               comments:
//             //                   "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//             //             ),
//             //             SizedBox(width: 20),
//             //             BlogContainerwidget(
//             //               screenHeight: screenHeight,
//             //               screenWidth: screenWidth,
//             //               containerImage: 'assets/images/blog-2.jpg',
//             //               profileImage: 'assets/images/user.jpg',
//             //               name: 'John Doe',
//             //               jobTitle: "Web Design",
//             //               heading: "Kasd tempor diam sea justo dolor",
//             //               comments:
//             //                   "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//             //             ),
//             //           ],
//             //         ),
//             //       ],
//             //     ),
//             //   )
//             : Container(
//                 margin: EdgeInsets.only(top: 50, left: 80, right: 80),
//                 // padding: EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//                     Text(
//                       "OUR BLOG",
//                       style: TextStyle(
//                         color: Color(0xFFFF4800),
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "Latest From Blog",
//                       style: GoogleFonts.poppins(
//                         fontSize: 35,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.all(40),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             BlogContainerwidget(
//                               screenHeight: screenHeight,
//                               screenWidth: screenWidth,
//                               containerImage: 'assets/images/blog-1.jpg',
//                               profileImage: 'assets/images/user.jpg',
//                               name: 'John Doe',
//                               jobTitle: "Web Design",
//                               heading: "Kasd tempor diam sea justo dolor",
//                               comments:
//                                   "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                             ),
//                             SizedBox(width: 20),
//                             BlogContainerwidget(
//                               screenHeight: screenHeight,
//                               screenWidth: screenWidth,
//                               containerImage: 'assets/images/blog-2.jpg',
//                               profileImage: 'assets/images/user.jpg',
//                               name: 'John Doe',
//                               jobTitle: "Web Design",
//                               heading: "Kasd tempor diam sea justo dolor",
//                               comments:
//                                   "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                             ),
//                             // Flexible(
//                             //   flex: 1,
//                             //   child: Stack(
//                             //     children: [
//                             //       Container(
//                             //         height: screenHeight * 1.3,
//                             //         width: screenWidth * 0.5,
//                             //         color: Color(0xffF2F2F4),
//                             //         child: Column(
//                             //           // mainAxisAlignment:
//                             //           //     MainAxisAlignment.spaceAround,
//                             //           children: [
//                             //             Container(
//                             //               height: screenHeight * 0.80,
//                             //               width: screenWidth * 0.65,
//                             //               // color: Color(0xFFFF4800),
//                             //               child: Image.asset(
//                             //                 'assets/images/blog-2.jpg',
//                             //                 width: double.infinity,
//                             //                 // height: 250,
//                             //                 fit: BoxFit.cover,
//                             //               ),
//                             //             ),

//                             //             Padding(
//                             //               padding: const EdgeInsets.all(28.0),
//                             //               child: Column(
//                             //                 crossAxisAlignment:
//                             //                     CrossAxisAlignment.start,
//                             //                 children: [
//                             //                   Row(
//                             //                     children: [
//                             //                       CircleAvatar(
//                             //                         radius: 24,
//                             //                         backgroundImage: NetworkImage(
//                             //                           'assets/images/user.jpg',
//                             //                         ),
//                             //                       ),
//                             //                       SizedBox(width: 15),

//                             //                       Text(
//                             //                         "John Doe",
//                             //                         style: GoogleFonts.aboreto(
//                             //                           // fontSize: 20,
//                             //                           fontWeight:
//                             //                               FontWeight.bold,
//                             //                           color: Colors.grey,
//                             //                         ),
//                             //                       ),
//                             //                       SizedBox(width: 15),
//                             //                       Icon(
//                             //                         Icons.bookmark_border_sharp,
//                             //                         color: Color(0xFFFF4800),
//                             //                       ),
//                             //                       Text(
//                             //                         "Web Design",
//                             //                         style: GoogleFonts.poppins(
//                             //                           // fontSize: 20,
//                             //                           fontWeight:
//                             //                               FontWeight.bold,
//                             //                           color: Colors.grey,
//                             //                         ),
//                             //                       ),
//                             //                     ],
//                             //                   ),
//                             //                   SizedBox(height: 15),
//                             //                   Text(
//                             //                     "Kasd tempor diam sea justo dolor",
//                             //                     style: GoogleFonts.mochiyPopOne(
//                             //                       fontSize: 25,
//                             //                       fontWeight: FontWeight.bold,
//                             //                       color: Colors.black,
//                             //                     ),
//                             //                   ),
//                             //                   SizedBox(height: 15),
//                             //                   Text(
//                             //                     "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                             //                   ),
//                             //                   SizedBox(height: 15),
//                             //                   Row(
//                             //                     children: [
//                             //                       Text(
//                             //                         "READ MORE",
//                             //                         style: GoogleFonts.aboreto(
//                             //                           // fontSize: 20,
//                             //                           fontWeight:
//                             //                               FontWeight.bold,
//                             //                           color: Color(0xFFFF4800),
//                             //                         ),
//                             //                       ),
//                             //                       SizedBox(width: 5),
//                             //                       Icon(
//                             //                         Icons
//                             //                             .arrow_forward_ios_outlined,
//                             //                         size: 13,
//                             //                         color: Color(0xFFFF4800),
//                             //                       ),
//                             //                     ],
//                             //                   ),
//                             //                 ],
//                             //               ),
//                             //             ),
//                             //           ],
//                             //         ),
//                             //       ),
//                             //       Positioned(
//                             //         bottom: 270,
//                             //         right: 20,

//                             //         child: CircleAvatar(
//                             //           radius: 35,
//                             //           backgroundColor: Colors.red,
//                             //           child: Align(
//                             //             alignment: Alignment.center,
//                             //             child: Column(
//                             //               children: [
//                             //                 Text(
//                             //                   "01",
//                             //                   style: GoogleFonts.poppins(
//                             //                     fontSize: 20,
//                             //                     fontWeight: FontWeight.bold,
//                             //                     color: Colors.black,
//                             //                   ),
//                             //                 ),

//                             //                 Text(
//                             //                   "JAN",
//                             //                   style: GoogleFonts.poppins(
//                             //                     fontSize: 20,
//                             //                     fontWeight: FontWeight.bold,
//                             //                     color: Colors.white,
//                             //                   ),
//                             //                 ),
//                             //               ],
//                             //             ),
//                             //           ),
//                             //         ),
//                             //       ),
//                             //     ],
//                             //   ),
//                             // ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//       },
//     );
//   }
// }

// class BlogContainerwidget extends StatelessWidget {
//   String containerImage;
//   String profileImage;
//   String name;
//   String jobTitle;
//   String heading;
//   String comments;
//   BlogContainerwidget({
//     super.key,
//     required this.containerImage,
//     required this.profileImage,
//     required this.name,
//     required this.jobTitle,
//     required this.heading,
//     required this.comments,

//     required this.screenHeight,
//     required this.screenWidth,
//   });

//   final double screenHeight;
//   final double screenWidth;

//   @override
//   Widget build(BuildContext context) {
//     return Flexible(
//       flex: 1,
//       child: Stack(
//         children: [
//           Container(
//             height: screenHeight * 1.3,
//             width: screenWidth * 0.5,
//             color: Color(0xffF2F2F4),
//             child: Column(
//               // mainAxisAlignment:
//               //     MainAxisAlignment.spaceAround,
//               children: [
//                 Container(
//                   height: screenHeight * 0.80,
//                   width: screenWidth * 0.65,
//                   // color: Color(0xFFFF4800),
//                   child: Image.asset(
//                     // 'assets/images/blog-1.jpg',
//                     containerImage,
//                     width: double.infinity,
//                     // height: 250,
//                     fit: BoxFit.cover,
//                   ),
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.all(28.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 24,
//                             backgroundImage: NetworkImage(
//                               // 'assets/images/user.jpg',
//                               profileImage,
//                             ),
//                           ),
//                           SizedBox(width: 15),

//                           Text(
//                             // "John Doe",
//                             name,
//                             style: GoogleFonts.aboreto(
//                               // fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),
//                           ),
//                           SizedBox(width: 15),
//                           Icon(
//                             Icons.bookmark_border_sharp,
//                             color: Color(0xFFFF4800),
//                           ),
//                           Text(
//                             // "Web Design",
//                             jobTitle,
//                             style: GoogleFonts.poppins(
//                               // fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.grey,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 15),
//                       Text(
//                         // "Kasd tempor diam sea justo dolor",
//                         heading,
//                         style: GoogleFonts.mochiyPopOne(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Text(
//                         // "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
//                         comments,
//                       ),
//                       SizedBox(height: 15),

//                       Row(
//                         children: [
//                           Text(
//                             "READ MORE",
//                             style: GoogleFonts.aboreto(
//                               // fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFFFF4800),
//                             ),
//                           ),
//                           SizedBox(width: 5),
//                           Icon(
//                             Icons.arrow_forward_ios_outlined,
//                             size: 13,
//                             color: Color(0xFFFF4800),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 270,
//             right: 20,

//             child: CircleAvatar(
//               radius: 35,
//               backgroundColor: Colors.red,
//               child: Align(
//                 alignment: Alignment.center,
//                 child: Column(
//                   children: [
//                     Text(
//                       "01",
//                       style: GoogleFonts.poppins(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     Text(
//                       "JAN",
//                       style: GoogleFonts.poppins(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  static const Color primaryColor = Color(0xFFFF4800);
  static const Color backgroundColor = Color(0xffF2F2F4);
  static const Color textColor = Color(0xFF171717);
  static const Color secondaryTextColor = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 70,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double screenWidth = constraints.maxWidth;

              final bool isMobile = screenWidth < 650;

              const double spacing = 28;

              final double cardWidth = isMobile
                  ? screenWidth
                  : (screenWidth - spacing) / 2;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section heading
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor.withValues(alpha: 0.10),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'OUR BLOG',
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Latest News & Articles',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 28 : 38,
                            fontWeight: FontWeight.w800,
                            color: textColor,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 14),
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 650,
                          ),
                          child: const Text(
                            'Discover insights, practical tips, and updates '
                            'to help you make smarter logistics and delivery '
                            'decisions for your business.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.8,
                              color: secondaryTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 45),

                  // Blog cards
                  Wrap(
                    spacing: spacing,
                    runSpacing: 28,
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: BlogContainerwidget(
                          containerImage: 'assets/images/blog-1.jpg',
                          profileImage: 'assets/images/user.jpg',
                          name: 'Logistics Team',
                          jobTitle: 'Logistics & Delivery',
                          heading:
                              'How Efficient Logistics Keeps Your Business Moving',
                          comments:
                              'Discover how effective planning, reliable '
                              'transportation, and timely deliveries can '
                              'improve customer satisfaction and help your '
                              'business grow.',
                          date: '11 OCT', screenHeight: 8, screenWidth: 8,
                        ),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: BlogContainerwidget(
                          containerImage: 'assets/images/blog-2.jpg',
                          profileImage: 'assets/images/user.jpg',
                          name: 'Logistics Team',
                          jobTitle: 'Supply Chain',
                          heading:
                              'Smart Ways to Improve Your Delivery Operations',
                          comments:
                              'Learn how better route planning, real-time '
                              'tracking, and clear communication can reduce '
                              'delivery delays and make your operations '
                              'more efficient.',
                          date: '08 OCT', screenHeight: 8, screenWidth: 8,
                        ),
                      ),
                    ],
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

class BlogContainerwidget extends StatelessWidget {
  final String containerImage;
  final String profileImage;
  final String name;
  final String jobTitle;
  final String heading;
  final String comments;
  final String date;

  const BlogContainerwidget({
    super.key,
    required this.containerImage,
    required this.profileImage,
    required this.name,
    required this.jobTitle,
    required this.heading,
    required this.comments,
    required this.date, required int screenHeight, required int screenWidth,
  });

  static const Color primaryColor = Color(0xFFFF4800);
  static const Color textColor = Color(0xFF171717);
  static const Color secondaryTextColor = Color(0xFF666666);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Blog image
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  containerImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: const Color(0xFFE8E8E8),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 45,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),

                // Image overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.35),
                      ],
                    ),
                  ),
                ),

                // Date label
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      date,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blog details
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Author information
                Row(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: const Color(0xFFF0F0F0),
                      backgroundImage: AssetImage(profileImage),
                      onBackgroundImageError: (exception, stackTrace) {},
                      child: null,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            jobTitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 22),

                // Article heading
                Text(
                  heading,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 21,
                    height: 1.4,
                    fontWeight: FontWeight.w800,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 12),

                // Article description
                Text(
                  comments,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.8,
                    color: secondaryTextColor,
                  ),
                ),

                const SizedBox(height: 22),

                // Read more label
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'READ MORE',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward,
                      color: primaryColor,
                      size: 17,
                    ),
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
