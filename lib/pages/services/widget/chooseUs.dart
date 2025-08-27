import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WhyChooseUs extends StatefulWidget {
  const WhyChooseUs({super.key});

  @override
  State<WhyChooseUs> createState() => _WhyChooseUsState();
}

class _WhyChooseUsState extends State<WhyChooseUs> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final bool isMobile = constraints.maxWidth < 900;
        //  final bool isMobile = screenWidth <= 648;
        final bool isTablet = screenWidth > 648 && screenWidth <= 1000;
        final bool isDesktop = screenWidth > 1000;

        return isMobile
            ? Container(
                height: screenHeight * 2.0,
                color: Color(0xfff2f2f4),
                // color: Colors.amber,
                child: Column(
                  children: [
                    /// LEFT COLUMN (Image and Strip)
                    Container(
                      // margin: EdgeInsets.only(left: 40),
                      height: screenHeight * 1.0,
                      width: screenWidth * 0.9,
                      child: Image.asset(
                        'assets/images/feature.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 20),

                    /// RIGHT COLUMN (Text Content)
                    Flexible(
                      flex: 2,
                      child: Container(
                        // height: 550,
                        // color: Colors.green,
                        margin: EdgeInsets.all(60),
                        // padding: EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHY CHOOSE US",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF4800),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Faster, Safe and Trusted Logistic Services",
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Best In Industry",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Emergency Services",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "24/7 Customer Support",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Flexible(
                              child: Container(
                                // margin: EdgeInsets.only(left: 40),
                                height: 50,
                                width: 200,
                                color: Color(0xFFFF4800),
                                child: Center(
                                  child: Text(
                                    "Learn More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Color(0xffFFF6F3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : isTablet
            ? Container(
                height: screenHeight * 2.5,
                color: Color(0xfff2f2f4),
                // color: Colors.amber,
                child: Column(
                  children: [
                    /// LEFT COLUMN (Image and Strip)
                    Container(
                      margin: EdgeInsets.only(left: 80, right: 80),
                      height: screenHeight * 1.7,
                      width: screenWidth * 0.9,
                      child: Image.asset(
                        'assets/images/feature.jpg',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 20),

                    /// RIGHT COLUMN (Text Content)
                    Flexible(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.only(left: 80, right: 80, top: 40),
                        // height: 550,
                        // color: Colors.green,
                        // margin: EdgeInsets.all(60),
                        padding: EdgeInsets.all(5),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHY CHOOSE US",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF4800),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Faster, Safe and Trusted Logistic Services",
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Best In Industry",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Emergency Services",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "24/7 Customer Support",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Flexible(
                              child: Container(
                                // margin: EdgeInsets.only(left: 40),
                                height: 50,
                                width: 200,
                                color: Color(0xFFFF4800),
                                child: Center(
                                  child: Text(
                                    "Learn More",
                                    style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Color(0xffFFF6F3),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                // height: screenHeight * 0.9,
                color: Color(0xfff2f2f4),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      /// LEFT COLUMN (Image and Strip)
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 40),
                              height: screenHeight * 0.9,
                              width: constraints.maxWidth * 0.3,
                              child: Image.asset(
                                'assets/images/feature.jpg',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 20),

                      /// RIGHT COLUMN (Text Content)
                      Flexible(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "WHY CHOOSE US",
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFFF4800),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Faster, Safer and Trusted Logistic Services",
                              style: GoogleFonts.poppins(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Best In Industry",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Emergency Services",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.stop_circle_outlined,
                                  color: Color(0xFFFF4800),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "24/7 Customer Support",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Container(
                              // margin: EdgeInsets.only(left: 40),
                              height: 50,
                              width: 200,
                              color: Color(0xFFFF4800),
                              child: Center(
                                child: Text(
                                  "Learn More",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    color: Color(0xffFFF6F3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
