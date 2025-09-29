import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/responsiveness.dart';

class OurServiceWidget extends StatefulWidget {
  const OurServiceWidget({super.key});

  @override
  State<OurServiceWidget> createState() => _OurServiceWidgetState();
}

class _OurServiceWidgetState extends State<OurServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // double screenWidth = constraints.maxWidth;
        // double screenHeight = constraints.maxHeight;
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        final bool isMobile = screenWidth <= 648;
        final bool isTablet = screenWidth > 648 && screenWidth <= 1000;
        final bool isDesktop = screenWidth > 1000;

        return isDesktop
            ? Container(
                // margin: EdgeInsets.all(40),
                height: screenHeight * 0.9,

                //  screenHeight * 0.7,
                margin: EdgeInsets.only(right: 40, left: 30),
                // padding: EdgeInsets.only(right: 80, left: 80),
                child: Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(
                        "OUR SERVICES",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFF4800),
                        ),
                      ),
                      Text(
                        "Best Logistics Services",
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        // color: Colors.green,
                        margin: EdgeInsets.only(left: 15, right: 15),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlexibleServiceCard(
                              width: 300,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.airplanemode_active_outlined,
                              text: "Air Freight",
                            ),
                            SizedBox(width: 5),
                            FlexibleServiceCard(
                              width: 300,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.airplanemode_active_outlined,
                              text: "Air Freight",
                            ),

                            SizedBox(width: 5),
                            FlexibleServiceCard(
                              width: 300,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.fire_truck_sharp,
                              text: "Land Transport",
                            ),

                            SizedBox(width: 5),

                            FlexibleServiceCard(
                              width: 300,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.storefront_sharp,
                              text: "Cargo Storage",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            :
              //  Responsive.isMobileLarge(context)
              isTablet
            ? Container(
                color: Color(0xffF2F2F4),
                height: screenHeight * 1.0,
                // color: Responsive.isMobile(context)
                //     ? const Color(0xffF2F2F4)
                //     : null,
                // height: Responsive.isDesktop(context)
                //     ? screenHeight * 0.7
                //     : null,
                // color: isMobile ? const Color(0xffF2F2F4) : null,
                // height: isDesktop ? screenHeight * 0.7 : null,
                // padding: const EdgeInsets.only(left: 15, right: 15),
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "OUR SERVICES",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF4800),
                      ),
                    ),
                    Text(
                      "Best Logistics Services",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // GridView wrapped with SizedBox to constrain height
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Container(
                        // margin: EdgeInsets.only(right: 10, left: 10),
                        height:
                            screenHeight *
                            0.75, // Adjust based on expected content
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 25,
                          mainAxisSpacing: 25,
                          childAspectRatio: 2,

                          //  1.75,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            FlexibleServiceCard(
                              width: 400,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.fire_truck_sharp,
                              text: "Land Transport",
                            ),
                            FlexibleServiceCard(
                              width: 400,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.fire_truck_sharp,
                              text: "Land Transport",
                            ),
                            FlexibleServiceCard(
                              width: 400,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.fire_truck_sharp,
                              text: "Land Transport",
                            ),
                            FlexibleServiceCard(
                              width: 400,
                              comment:
                                  "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                              icon: Icons.fire_truck_sharp,
                              text: "Land Transport",
                            ),
                          ],
                          // List.generate(4, (index) => _serviceCard()),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : isMobile
            //  Responsive.isMobile(context)
            ? Container(
                height: 900,
                // width: screenWidth * 3.0,
                // color: Colors.red,
                // margin: EdgeInsets.all(40),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 35),
                    Text(
                      "OUR SERVICES",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFFF4800),
                      ),
                    ),
                    Text(
                      "Best Logistics Services",
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: screenWidth * 0.9,

                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: screenWidth * 0.9,
                            color: const Color(0xFFFF4800),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Air Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: screenWidth * 0.9,

                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: screenWidth * 0.9,
                            color: const Color(0xFFFF4800),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Air Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: screenWidth * 0.9,

                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: screenWidth * 0.9,
                            color: const Color(0xFFFF4800),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Air Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: screenWidth * 0.9,

                      // color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 80,
                            width: screenWidth * 0.9,
                            color: const Color(0xFFFF4800),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.airplanemode_active_outlined,
                                  color: Colors.black,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "Air Freight",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Center(
                            child: Text(
                              "Read More",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: const Color(0xFFFF4800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // FlexibleServiceCard(
                    //   width: 300,

                    //   // screenWidth * 0.4,
                    //   comment:
                    //       "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                    //   icon: Icons.airplanemode_active_outlined,
                    //   text: "Air Freight",
                    // ),
                    // SizedBox(width: 5),
                    // FlexibleServiceCard(
                    //   width: 300,
                    //   // screenWidth * 0.4,
                    //   comment:
                    //       "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                    //   icon: Icons.airplanemode_active_outlined,
                    //   text: "Air Freight",
                    // ),

                    //
                    // FlexibleServiceCard(
                    //   width: 300,

                    //   //  screenWidth * 0.4,
                    //   comment:
                    //       "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                    //   icon: Icons.fire_truck_sharp,
                    //   text: "Land Transport",
                    // ),

                    // SizedBox(width: 5),

                    // FlexibleServiceCard(
                    //   width: 300,
                    //   // screenWidth * 0.4,
                    //   comment:
                    //       "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
                    //   icon: Icons.storefront_sharp,
                    //   text: "Cargo Storage",
                    // ),
                  ],
                ),
              )
            : widget;
      },
    );
  }
}

// Widget _serviceCard() {
//   return SizedBox(
//     // height: 300,
//     width: 250,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           height: 80,
//           color: const Color(0xFFFF4800),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Icon(Icons.airplanemode_active_outlined, color: Colors.white),
//               SizedBox(width: 10),
//               Text(
//                 "Air Freight",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 10),
//         Flexible(
//           child: Text(
//             "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         Center(
//           child: Text(
//             "Read More",
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: const Color(0xFFFF4800),
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }

class FlexibleServiceCard extends StatelessWidget {
  String text;
  IconData icon;
  String comment;
  double width;
  FlexibleServiceCard({
    super.key,
    required this.comment,
    required this.icon,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Expanded(
      child: Container(
        // margin: EdgeInsets.only(right: 40, left: 40),
        width: screenWidth * 0.3,
        height: screenHeight * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 80,
              width: width,
              color: const Color(0xFFFF4800),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,

                    // Icons.airplanemode_active_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,

                    // "Air Freight",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Text(
              comment,
              // "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                "Read More",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFF4800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
