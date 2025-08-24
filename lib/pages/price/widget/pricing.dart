import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;

        final bool isMobile = screenWidth <= 600;
        final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
        final bool isDesktop = screenWidth > 1000;

        return isMobile
            ? Container(
                height: screenHeight * 2.9,
                margin: EdgeInsets.only(top: 30),
                // padding: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "PRICING PLAN",
                        style: TextStyle(
                          color: Color(0xFFFF4800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Affordable Pricing Packages",
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: screenHeight * 0.8,
                              width: screenHeight * 0.65,
                              color: Color(0xffF2F2F4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip
                                            .none, // allow positioning outside the bounds
                                        children: [
                                          Text(
                                            '49',
                                            style: GoogleFonts.poppins(
                                              fontSize: 45,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0, // move dollar up
                                            left:
                                                -12, // move dollar to the left
                                            child: Text(
                                              '\$',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(width: 8),
                                      Text(
                                        '/Mo',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 80,
                                    width: screenHeight * 0.65,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Basic',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("HTML5 & CSS3"),
                                  Text("Bootstrap 4"),
                                  Text("Responsive Layout"),
                                  Text("Compatible With All Browsers"),
                                  Container(
                                    height: 50,
                                    width: screenHeight * 0.3,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Order now',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: screenHeight * 0.8,
                              width: screenHeight * 0.65,
                              color: Color(0xffF2F2F4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip
                                            .none, // allow positioning outside the bounds
                                        children: [
                                          Text(
                                            '99',
                                            style: GoogleFonts.poppins(
                                              fontSize: 45,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0, // move dollar up
                                            left:
                                                -12, // move dollar to the left
                                            child: Text(
                                              '\$',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(width: 8),
                                      Text(
                                        '/Mo',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 80,
                                    width: screenHeight * 0.65,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Premium',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("HTML5 & CSS3"),
                                  Text("Bootstrap 4"),
                                  Text("Responsive Layout"),
                                  Text("Compatible With All Browsers"),
                                  Container(
                                    height: 50,
                                    width: screenHeight * 0.3,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Order now',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Container(
                              height: screenHeight * 0.8,
                              width: screenHeight * 0.65,
                              color: Color(0xffF2F2F4),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Stack(
                                        clipBehavior: Clip
                                            .none, // allow positioning outside the bounds
                                        children: [
                                          Text(
                                            '149',
                                            style: GoogleFonts.poppins(
                                              fontSize: 45,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Positioned(
                                            top: 0, // move dollar up
                                            left:
                                                -12, // move dollar to the left
                                            child: Text(
                                              '\$',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey[700],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // const SizedBox(width: 8),
                                      Text(
                                        '/Mo',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 80,
                                    width: screenHeight * 0.65,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Business',
                                        style: GoogleFonts.poppins(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text("HTML5 & CSS3"),
                                  Text("Bootstrap 4"),
                                  Text("Responsive Layout"),
                                  Text("Compatible With All Browsers"),
                                  Container(
                                    height: 50,
                                    width: screenHeight * 0.3,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Order now',
                                        style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffFFFFFF),
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
                    ],
                  ),
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 30),
                // padding: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.only(left: 80, right: 80),
                  child: Column(
                    children: [
                      Text(
                        "PRICING PLAN",
                        style: TextStyle(
                          color: Color(0xFFFF4800),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Affordable Pricing Packages",
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: screenHeight * 0.8,
                                width: screenHeight * 0.55,
                                color: Color(0xffF2F2F4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip
                                              .none, // allow positioning outside the bounds
                                          children: [
                                            Text(
                                              '49',
                                              style: GoogleFonts.poppins(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0, // move dollar up
                                              left:
                                                  -12, // move dollar to the left
                                              child: Text(
                                                '\$',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(width: 8),
                                        Text(
                                          '/Mo',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: screenHeight * 0.65,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Basic',
                                          style: GoogleFonts.poppins(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("HTML5 & CSS3"),
                                    Text("Bootstrap 4"),
                                    Text("Responsive Layout"),
                                    Text("Compatible With All Browsers"),
                                    Container(
                                      height: 50,
                                      width: screenHeight * 0.3,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Order now',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: screenHeight * 0.8,
                                width: screenHeight * 0.55,
                                color: Color(0xffF2F2F4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip
                                              .none, // allow positioning outside the bounds
                                          children: [
                                            Text(
                                              '99',
                                              style: GoogleFonts.poppins(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0, // move dollar up
                                              left:
                                                  -12, // move dollar to the left
                                              child: Text(
                                                '\$',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(width: 8),
                                        Text(
                                          '/Mo',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: screenHeight * 0.65,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Premium',
                                          style: GoogleFonts.poppins(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("HTML5 & CSS3"),
                                    Text("Bootstrap 4"),
                                    Text("Responsive Layout"),
                                    Text("Compatible With All Browsers"),
                                    Container(
                                      height: 50,
                                      width: screenHeight * 0.3,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Order now',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFFFFFF),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              flex: 1,
                              child: Container(
                                height: screenHeight * 0.8,
                                width: screenHeight * 0.55,
                                color: Color(0xffF2F2F4),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Stack(
                                          clipBehavior: Clip
                                              .none, // allow positioning outside the bounds
                                          children: [
                                            Text(
                                              '149',
                                              style: GoogleFonts.poppins(
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0, // move dollar up
                                              left:
                                                  -12, // move dollar to the left
                                              child: Text(
                                                '\$',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.grey[700],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // const SizedBox(width: 8),
                                        Text(
                                          '/Mo',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey[700],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 80,
                                      width: screenHeight * 0.65,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Business',
                                          style: GoogleFonts.poppins(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text("HTML5 & CSS3"),
                                    Text("Bootstrap 4"),
                                    Text("Responsive Layout"),
                                    Text("Compatible With All Browsers"),
                                    Container(
                                      height: 50,
                                      width: screenHeight * 0.3,
                                      color: Color(0xFFFF4800),
                                      child: Center(
                                        child: Text(
                                          'Order now',
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffFFFFFF),
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
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
