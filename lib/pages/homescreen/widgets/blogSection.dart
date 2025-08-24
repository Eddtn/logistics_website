import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogSection extends StatefulWidget {
  const BlogSection({super.key});

  @override
  State<BlogSection> createState() => _BlogSectionState();
}

class _BlogSectionState extends State<BlogSection> {
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
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                // padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "OUR BLOG",
                      style: TextStyle(
                        color: Color(0xFFFF4800),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Latest From Blog",
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 1.0,
                          width: screenWidth * 0.9,
                          color: Color(0xffF2F2F4),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenHeight * 0.50,
                                width: screenWidth * 0.9,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-1.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                            'assets/images/user.jpg',
                                          ),
                                        ),
                                        SizedBox(width: 15),

                                        Text(
                                          "John Doe",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(
                                          Icons.bookmark_border_sharp,
                                          color: Color(0xFFFF4800),
                                        ),
                                        Text(
                                          "Web Design",
                                          style: GoogleFonts.poppins(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Kasd tempor diam sea justo dolor",
                                      style: GoogleFonts.mochiyPopOne(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                    ),
                                    SizedBox(height: 15),

                                    Row(
                                      children: [
                                        Text(
                                          "READ MORE",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFF4800),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 13,
                                          color: Color(0xFFFF4800),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 260,
                          right: 20,

                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "01",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "JAN",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 20),
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 1.0,
                          width: screenWidth * 0.9,
                          color: Color(0xffF2F2F4),
                          child: Column(
                            // mainAxisAlignment:
                            //     MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: screenHeight * 0.50,
                                width: screenWidth * 0.9,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-2.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                            'assets/images/user.jpg',
                                          ),
                                        ),
                                        SizedBox(width: 15),

                                        Text(
                                          "John Doe",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(
                                          Icons.bookmark_border_sharp,
                                          color: Color(0xFFFF4800),
                                        ),
                                        Text(
                                          "Web Design",
                                          style: GoogleFonts.poppins(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Kasd tempor diam sea justo dolor",
                                      style: GoogleFonts.mochiyPopOne(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                    ),
                                    SizedBox(height: 15),

                                    Row(
                                      children: [
                                        Text(
                                          "READ MORE",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFF4800),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 13,
                                          color: Color(0xFFFF4800),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 260,
                          right: 20,

                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "01",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "JAN",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : isTablet
            ? Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                // padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "OUR BLOG",
                      style: TextStyle(
                        color: Color(0xFFFF4800),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Latest From Blog",
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.95,
                          width: screenWidth * 0.7,
                          color: Color(0xffF2F2F4),
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight * 0.50,
                                width: screenWidth * 0.7,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-1.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                            'assets/images/user.jpg',
                                          ),
                                        ),
                                        SizedBox(width: 15),

                                        Text(
                                          "John Doe",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(
                                          Icons.bookmark_border_sharp,
                                          color: Color(0xFFFF4800),
                                        ),
                                        Text(
                                          "Web Design",
                                          style: GoogleFonts.poppins(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Kasd tempor diam sea justo dolor",
                                      style: GoogleFonts.mochiyPopOne(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                    ),
                                    SizedBox(height: 15),

                                    Row(
                                      children: [
                                        Text(
                                          "READ MORE",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFF4800),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 13,
                                          color: Color(0xFFFF4800),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 240,
                          right: 20,

                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "01",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "JAN",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          height: screenHeight * 0.95,
                          width: screenWidth * 0.7,
                          color: Color(0xffF2F2F4),
                          child: Column(
                            children: [
                              Container(
                                height: screenHeight * 0.50,
                                width: screenWidth * 0.7,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-2.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(28.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundImage: NetworkImage(
                                            'assets/images/user.jpg',
                                          ),
                                        ),
                                        SizedBox(width: 15),

                                        Text(
                                          "John Doe",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Icon(
                                          Icons.bookmark_border_sharp,
                                          color: Color(0xFFFF4800),
                                        ),
                                        Text(
                                          "Web Design",
                                          style: GoogleFonts.poppins(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Kasd tempor diam sea justo dolor",
                                      style: GoogleFonts.mochiyPopOne(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                    ),
                                    SizedBox(height: 15),

                                    Row(
                                      children: [
                                        Text(
                                          "READ MORE",
                                          style: GoogleFonts.aboreto(
                                            // fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFF4800),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.arrow_forward_ios_outlined,
                                          size: 13,
                                          color: Color(0xFFFF4800),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 240,
                          right: 20,

                          child: CircleAvatar(
                            radius: 35,
                            backgroundColor: Colors.red,
                            child: Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    "01",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "JAN",
                                    style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: 30, left: 30, right: 30),
                // padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      "OUR BLOG",
                      style: TextStyle(
                        color: Color(0xFFFF4800),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Latest From Blog",
                      style: GoogleFonts.poppins(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    height: screenHeight * 1.3,
                                    width: screenWidth * 0.5,
                                    color: Color(0xffF2F2F4),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: screenHeight * 0.80,
                                          width: screenWidth * 0.65,
                                          // color: Color(0xFFFF4800),
                                          child: Image.asset(
                                            'assets/images/blog-1.jpg',
                                            width: double.infinity,
                                            // height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(28.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 24,
                                                    backgroundImage: NetworkImage(
                                                      'assets/images/user.jpg',
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),

                                                  Text(
                                                    "John Doe",
                                                    style: GoogleFonts.aboreto(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Icon(
                                                    Icons.bookmark_border_sharp,
                                                    color: Color(0xFFFF4800),
                                                  ),
                                                  Text(
                                                    "Web Design",
                                                    style: GoogleFonts.poppins(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                "Kasd tempor diam sea justo dolor",
                                                style: GoogleFonts.mochiyPopOne(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                              ),
                                              SizedBox(height: 15),

                                              Row(
                                                children: [
                                                  Text(
                                                    "READ MORE",
                                                    style: GoogleFonts.aboreto(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFFF4800),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 13,
                                                    color: Color(0xFFFF4800),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 240,
                                    right: 20,

                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.red,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              "01",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              "JAN",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              flex: 1,
                              child: Stack(
                                children: [
                                  Container(
                                    height: screenHeight * 1.3,
                                    width: screenWidth * 0.5,
                                    color: Color(0xffF2F2F4),
                                    child: Column(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: screenHeight * 0.80,
                                          width: screenWidth * 0.65,
                                          // color: Color(0xFFFF4800),
                                          child: Image.asset(
                                            'assets/images/blog-2.jpg',
                                            width: double.infinity,
                                            // height: 250,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.all(28.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 24,
                                                    backgroundImage: NetworkImage(
                                                      'assets/images/user.jpg',
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),

                                                  Text(
                                                    "John Doe",
                                                    style: GoogleFonts.aboreto(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Icon(
                                                    Icons.bookmark_border_sharp,
                                                    color: Color(0xFFFF4800),
                                                  ),
                                                  Text(
                                                    "Web Design",
                                                    style: GoogleFonts.poppins(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                "Kasd tempor diam sea justo dolor",
                                                style: GoogleFonts.mochiyPopOne(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    "READ MORE",
                                                    style: GoogleFonts.aboreto(
                                                      // fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFFFF4800),
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Icon(
                                                    Icons
                                                        .arrow_forward_ios_outlined,
                                                    size: 13,
                                                    color: Color(0xFFFF4800),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 240,
                                    right: 20,

                                    child: CircleAvatar(
                                      radius: 35,
                                      backgroundColor: Colors.red,
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Column(
                                          children: [
                                            Text(
                                              "01",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),

                                            Text(
                                              "JAN",
                                              style: GoogleFonts.poppins(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
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
                    ),
                  ],
                ),
              );
      },
    );
  }
}
