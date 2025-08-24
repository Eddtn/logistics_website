import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/customIcons.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = MediaQuery.of(context).size.height;
        final bool isMobile = screenWidth <= 600;
        final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
        final bool isDesktop = screenWidth > 1000;
        return isDesktop
            ? Container(
                // margin: EdgeInsets.only(top: 40),
                height: 400,
                color: Color(0xff1F1F2E),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 210,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Get In Touch",
                                  style: GoogleFonts.aBeeZee(
                                    color: Color(0xffFF4800),
                                    fontSize: 35,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "123 Street, New York, USA",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Icon(Icons.phone, color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      "+012 345 67890",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(Icons.email, color: Colors.white),
                                    SizedBox(width: 5),
                                    Text(
                                      "info@example.com",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                MyPage(shouldEnableHover: true),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Quick Links",
                                  style: GoogleFonts.aBeeZee(
                                    color: Color(0xffFF4800),
                                    fontSize: 35,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Home",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "About Us",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Our Services",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Pricing Plan",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Contact Us",
                                      style: GoogleFonts.aBeeZee(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: 350,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Newsletter",
                                  style: GoogleFonts.aBeeZee(
                                    color: Color(0xffFF4800),
                                    fontSize: 35,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Text(
                                  "Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum. Dolor duo eirmod sea justo no lorem est diam",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 10),

                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: 250,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          hintText: 'Your Email Address',
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white,
                                            ), // ✅ When not focused
                                            // borderRadius: BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xFFFF4800),
                                              width: 2,
                                            ), // ✅ When focused
                                            // borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 100,
                                      child: Container(
                                        height: 50,
                                        width: 150,
                                        color: Color(0xFFFF4800),
                                        child: Center(
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 5, color: Colors.white),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '@',
                                  style: TextStyle(color: Colors.white),
                                ),

                                TextSpan(
                                  text: 'Your Site Name.',
                                  style: TextStyle(color: Color(0xFFFF4800)),
                                ),
                                TextSpan(
                                  text: "All Rights Reserved. Designed by",
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: " ImhansSmartTech",
                                  style: TextStyle(color: Color(0xFFFF4800)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 300),
                          // Spacer(),
                          Wrap(
                            // spacing: 8,
                            children: [
                              Text(
                                "Privacy",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Terms",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "FAQs",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Help",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                // margin: EdgeInsets.only(top: 40),
                height: screenHeight * 1.4,
                color: Color(0xff1F1F2E),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 40),
                      child: SizedBox(
                        // width: 200,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Get In Touch",
                              style: GoogleFonts.aBeeZee(
                                color: Color(0xffFF4800),
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  "123 Street, New York, USA",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Icon(Icons.phone, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  "+012 345 67890",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(Icons.email, color: Colors.white),
                                SizedBox(width: 5),
                                Text(
                                  "info@example.com",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            MyPage(shouldEnableHover: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, top: 40),
                      child: SizedBox(
                        // width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quick Links",
                              style: GoogleFonts.aBeeZee(
                                color: Color(0xffFF4800),
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Home",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "About Us",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Our Services",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Pricing Plan",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Contact Us",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 28,
                        top: 40,
                        right: 10,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Newsletter",
                              style: GoogleFonts.aBeeZee(
                                color: Color(0xffFF4800),
                                fontSize: 35,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "Rebum labore lorem dolores kasd est, et ipsum amet et at kasd, ipsum sea tempor magna tempor. Accu kasd sed ea duo ipsum. Dolor duo eirmod sea justo no lorem est diam",
                              style: GoogleFonts.aBeeZee(color: Colors.white),
                            ),
                            SizedBox(height: 10),

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    width: 300,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(),
                                        hintText: 'Your Email Address',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white,
                                          ), // ✅ When not focused
                                          // borderRadius: BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFFF4800),
                                            width: 2,
                                          ), // ✅ When focused
                                          // borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 100,
                                  child: Container(
                                    height: 50,
                                    width: 150,
                                    color: Color(0xFFFF4800),
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Divider(height: 5, color: Colors.white),
                    SizedBox(height: 10),

                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '@',
                            style: TextStyle(color: Colors.white),
                          ),

                          TextSpan(
                            text: 'Your Site Name.',
                            style: TextStyle(color: Color(0xFFFF4800)),
                          ),
                          TextSpan(
                            text: "All Rights Reserved. Designed by",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: " ImhansSmartTech",
                            style: TextStyle(color: Color(0xFFFF4800)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      children: [
                        Text("Privacy", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text("Terms", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text("FAQs", style: TextStyle(color: Colors.white)),
                        SizedBox(width: 5),
                        Text("Help", style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ],
                ),
              );
      },
    );

    //   );
  }
}
