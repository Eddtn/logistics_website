import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/pages/homescreen/widgets/animatebutton.dart';

class aboutUsWidget extends StatelessWidget {
  const aboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final bool isMobile = constraints.maxWidth < 600;
        //  final bool isTablet = constraints.maxWidth <= 600 : > 1000;
        final bool isTablet = screenWidth > 600 && screenWidth <= 1000;

        return isMobile
            ? Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: screenHeight * 0.1),
                    height: screenHeight * 0.45,
                    width: screenWidth * 0.9,
                    child: Image.asset(
                      'assets/images/about.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9,
                    color: Color(0xFFFF4800),
                    child: Center(
                      child: Text(
                        "25+ Years Experience",
                        style: GoogleFonts.poppins(
                          fontSize: screenWidth * 0.045,
                          color: Color(0xff1F1F2E),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    margin: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "About Us",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFFF4800),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "Trusted & Faster Logistic Service Provider",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.1),
                        Row(
                          children: [
                            AnimatedPlayButton(),
                            SizedBox(width: screenWidth * 0.03),
                            Text(
                              "Play Video",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.1),
                      ],
                    ),
                  ),
                ],
              )
            : isTablet
            ? Container(
                margin: EdgeInsets.only(left: 80, right: 80),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.1),
                      height: screenHeight * 0.8,
                      width: screenWidth * 0.9,
                      child: Image.asset(
                        'assets/images/about.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.9,
                      color: Color(0xFFFF4800),
                      child: Center(
                        child: Text(
                          "25+ Years Experience",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.045,
                            color: Color(0xff1F1F2E),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Container(
                      width: screenWidth * 0.9,
                      // margin: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Us",
                            style: GoogleFonts.poppins(
                              fontSize: 30,
                              //  screenWidth * 0.045,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFF4800),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Trusted & Faster Logistic Service Provider",
                            style: GoogleFonts.poppins(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          Text(
                            "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
                            style: GoogleFonts.poppins(fontSize: 20),
                          ),
                          SizedBox(height: screenHeight * 0.1),
                          Row(
                            children: [
                              AnimatedPlayButton(),
                              SizedBox(width: screenWidth * 0.03),
                              Text(
                                "Play Video",
                                style: GoogleFonts.poppins(
                                  fontSize: screenWidth * 0.045,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.1),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  top: 40,
                  right: 40,
                  bottom: 40,
                ),
                child: Row(
                  children: [
                    /// LEFT COLUMN (Image and Strip)
                    Flexible(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 80),
                            color: Colors.green,
                            // padding: EdgeInsets.only(left: ),
                            height: 350,
                            width: constraints.maxWidth * 0.30,
                            child: Image.asset(
                              'assets/images/about.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 80),
                            padding: EdgeInsets.only(left: 50),
                            height: 70,
                            width: constraints.maxWidth * 0.30,

                            color: Color(0xFFFF4800),
                            child: Center(
                              child: Text(
                                "25+ Years Experience",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: Color(0xff1F1F2E),
                                ),
                              ),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "About Us",
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFFF4800),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Trusted & Faster Logistic Service Provider",
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
                              AnimatedPlayButton(),
                              SizedBox(width: 10),
                              Text(
                                "Play Video",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
