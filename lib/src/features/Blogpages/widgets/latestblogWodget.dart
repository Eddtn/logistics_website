import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/pagechange.dart';
import 'package:logistics_website/src/features/homescreen/widgets/blogSection.dart';

class LatestBlogWidget extends StatelessWidget {
  const LatestBlogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

    return Scaffold(
      body: Container(
        height: 1000,
        width: double.infinity,
        // padding: const EdgeInsets.all(40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobileOrTablet = constraints.maxWidth < 900; // breakpoint

            return isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First Column (Blog posts)
                      Column(
                        children: [
                          BlogContainerwidget(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            containerImage: 'assets/images/blog-1.jpg',
                            profileImage: 'assets/images/user.jpg',
                            name: 'John Doe',
                            jobTitle: "Web Design",
                            heading: "Kasd tempor diam sea justo dolor",
                            comments:
                                "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                          ),
                          BlogContainerwidget(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            containerImage: 'assets/images/blog-2.jpg',
                            profileImage: 'assets/images/user.jpg',
                            name: 'John Doe',
                            jobTitle: "Web Design",
                            heading: "Kasd tempor diam sea justo dolor",
                            comments:
                                "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                          ),
                          BlogContainerwidget(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth,
                            containerImage: 'assets/images/blog-1.jpg',
                            profileImage: 'assets/images/user.jpg',
                            name: 'John Doe',
                            jobTitle: "Web Design",
                            heading: "Kasd tempor diam sea justo dolor",
                            comments:
                                "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Second Column (Search, Categories, Recent Posts, etc.)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(left: 20),
                                  color: Color(0xffF2F2F4),
                                  height: screenHeight * 0.15,
                                  width: screenWidth * 0.3,

                                  child: Row(
                                    // crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 50,
                                        width: screenWidth * 0.2,

                                        child: TextField(
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(),
                                            hintText: 'Keyword',
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
                                        // height: 50,
                                        // width: 50,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          color: Color(0xFFFF4800),
                                          child: Center(
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Categories",
                                    style: GoogleFonts.mochiyPopOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                Container(
                                  // margin: EdgeInsets.only(left: 20),
                                  height: screenHeight * 0.4,
                                  width: screenWidth * 0.3,
                                  color: Color(0xffF2F2F4),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.2,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFFFF4800),
                                            ),
                                            Text("Web Design"),
                                            Text("150"),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.2,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFFFF4800),
                                            ),
                                            Text("Web Development"),
                                            Text("131"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.2,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFFFF4800),
                                            ),
                                            Text("Online Marketing"),
                                            Text("78"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.2,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFFFF4800),
                                            ),
                                            Text("Keyword Research"),
                                            Text("56"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.2,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(
                                              Icons.arrow_forward_ios_outlined,
                                              color: Color(0xFFFF4800),
                                            ),
                                            Text("Email Marketing"),
                                            Text("98"),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  ),
                                ),

                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Recent Post",
                                    style: GoogleFonts.mochiyPopOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                Container(
                                  width: screenWidth * 0.3,
                                  // margin: EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: screenHeight * 0.15,
                                        width: screenWidth * 0.3,
                                        color: Color(0xffF2F2F4),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.5,
                                              width: screenWidth * 0.1,
                                              // color: Color(0xFFFF4800),
                                              child: Image.asset(
                                                'assets/images/blog-1.jpg',
                                                width: double.infinity,
                                                // height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 25),
                                            Text(
                                              "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      Container(
                                        height: screenHeight * 0.15,
                                        width: screenWidth * 0.3,
                                        color: Color(0xffF2F2F4),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.5,
                                              width: screenWidth * 0.1,
                                              // color: Color(0xFFFF4800),
                                              child: Image.asset(
                                                'assets/images/blog-2.jpg',
                                                width: double.infinity,
                                                // height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      Container(
                                        height: screenHeight * 0.15,
                                        width: screenWidth * 0.3,
                                        color: Color(0xffF2F2F4),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.5,
                                              width: screenWidth * 0.1,
                                              // color: Color(0xFFFF4800),
                                              child: Image.asset(
                                                'assets/images/blog-1.jpg',
                                                width: double.infinity,
                                                // height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      Container(
                                        height: screenHeight * 0.15,
                                        width: screenWidth * 0.3,
                                        color: Color(0xffF2F2F4),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.5,
                                              width: screenWidth * 0.1,
                                              // color: Color(0xFFFF4800),
                                              child: Image.asset(
                                                'assets/images/blog-2.jpg',
                                                width: double.infinity,
                                                // height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),

                                      Container(
                                        height: screenHeight * 0.15,
                                        width: screenWidth * 0.3,
                                        color: Color(0xffF2F2F4),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: screenHeight * 0.5,
                                              width: screenWidth * 0.1,
                                              // color: Color(0xFFFF4800),
                                              child: Image.asset(
                                                'assets/images/blog-1.jpg',
                                                width: double.infinity,
                                                // height: 250,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: 20),
                                            Text(
                                              "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 45),

                                Container(
                                  // margin: EdgeInsets.only(left: 20),
                                  height: screenHeight * 0.4,
                                  width: screenWidth * 0.3,
                                  // color: Color(0xFFFF4800),
                                  child: Image.asset(
                                    'assets/images/blog-1.jpg',
                                    width: double.infinity,
                                    // height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 20),

                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Tag Cloud",
                                    style: GoogleFonts.mochiyPopOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  width: screenWidth * 0.3,
                                  child: Wrap(
                                    spacing: 55,
                                    // runSpacing: 20,
                                    children: [
                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("Design"),
                                      ),

                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("Development"),
                                      ),
                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("Marketing"),
                                      ),
                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("SEO"),
                                      ),
                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("Writing"),
                                      ),
                                      Container(
                                        height: screenHeight * 0.05,
                                        // width: screenWidth * 0.06,
                                        color: Color(0xffF2F2F4),
                                        child: Text("Consulting"),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: screenHeight * 0.4,
                                  width: screenWidth * 0.3,
                                  // color: Color(0xFFFF4800),
                                  child: Image.asset(
                                    'assets/images/blog-2.jpg',
                                    width: double.infinity,
                                    // height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Text(
                                    "Plain Text",
                                    style: GoogleFonts.mochiyPopOne(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: screenHeight * 0.5,
                                  width: screenWidth * 0.3,
                                  color: Color(0xffF2F2F4),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Vero sea et accusam justo dolor accusam lorem consetetur, dolores sit amet sit dolor clita kasd justo, diam accusam no sea ut tempor magna takimata, amet sit et diam dolor ipsum amet diam",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        Container(
                                          height: screenHeight * 0.06,
                                          width: screenWidth * 0.1,
                                          color: Color(0xFFFF4800),
                                          child: Center(
                                            child: Text(
                                              "Read More",
                                              style: TextStyle(
                                                color: Colors.white,
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
                          // ✅ Paste your entire second Expanded content here
                          // (search field, categories, recent posts, images, tag cloud, plain text...)
                        ],
                      ),
                    ],
                  )
                : Container(
                    // height: 00
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // First Column (Blog posts)
                        Expanded(
                          // flex: 2,
                          child: Column(
                            children: [
                              BlogContainerwidget(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                containerImage: 'assets/images/blog-1.jpg',
                                profileImage: 'assets/images/user.jpg',
                                name: 'John Doe',
                                jobTitle: "Web Design",
                                heading: "Kasd tempor diam sea justo dolor",
                                comments:
                                    "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                              ),
                              SizedBox(height: 20),
                              BlogContainerwidget(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                containerImage: 'assets/images/blog-2.jpg',
                                profileImage: 'assets/images/user.jpg',
                                name: 'John Doe',
                                jobTitle: "Web Design",
                                heading: "Kasd tempor diam sea justo dolor",
                                comments:
                                    "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                              ),
                              SizedBox(height: 20),
                              BlogContainerwidget(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                containerImage: 'assets/images/blog-1.jpg',
                                profileImage: 'assets/images/user.jpg',
                                name: 'John Doe',
                                jobTitle: "Web Design",
                                heading: "Kasd tempor diam sea justo dolor",
                                comments:
                                    "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores...",
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 30),

                        // Second Column (Search, Categories, Recent Posts, etc.)
                        Expanded(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // margin: EdgeInsets.only(left: 20),
                                color: Color(0xffF2F2F4),
                                height: screenHeight * 0.15,
                                width: screenWidth * 0.3,

                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: screenWidth * 0.2,

                                      child: TextField(
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          hintText: 'Keyword',
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
                                      // height: 50,
                                      // width: 50,
                                      child: Container(
                                        height: 50,
                                        width: 50,
                                        color: Color(0xFFFF4800),
                                        child: Center(
                                          child: Icon(
                                            Icons.search,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Categories",
                                  style: GoogleFonts.mochiyPopOne(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              Container(
                                // margin: EdgeInsets.only(left: 20),
                                height: screenHeight * 0.4,
                                width: screenWidth * 0.3,
                                color: Color(0xffF2F2F4),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFFFF4800),
                                          ),
                                          Text("Web Design"),
                                          Text("150"),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 5),

                                    Container(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFFFF4800),
                                          ),
                                          Text("Web Development"),
                                          Text("131"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFFFF4800),
                                          ),
                                          Text("Online Marketing"),
                                          Text("78"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFFFF4800),
                                          ),
                                          Text("Keyword Research"),
                                          Text("56"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      height: screenHeight * 0.06,
                                      width: screenWidth * 0.2,
                                      color: Colors.white,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color: Color(0xFFFF4800),
                                          ),
                                          Text("Email Marketing"),
                                          Text("98"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Recent Post",
                                  style: GoogleFonts.mochiyPopOne(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                              Container(
                                width: screenWidth * 0.3,
                                // margin: EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.3,
                                      color: Color(0xffF2F2F4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.5,
                                            width: screenWidth * 0.1,
                                            // color: Color(0xFFFF4800),
                                            child: Image.asset(
                                              'assets/images/blog-1.jpg',
                                              width: double.infinity,
                                              // height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 25),
                                          Text(
                                            "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),

                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.3,
                                      color: Color(0xffF2F2F4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.5,
                                            width: screenWidth * 0.1,
                                            // color: Color(0xFFFF4800),
                                            child: Image.asset(
                                              'assets/images/blog-2.jpg',
                                              width: double.infinity,
                                              // height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),

                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.3,
                                      color: Color(0xffF2F2F4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.5,
                                            width: screenWidth * 0.1,
                                            // color: Color(0xFFFF4800),
                                            child: Image.asset(
                                              'assets/images/blog-1.jpg',
                                              width: double.infinity,
                                              // height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),

                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.3,
                                      color: Color(0xffF2F2F4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.5,
                                            width: screenWidth * 0.1,
                                            // color: Color(0xFFFF4800),
                                            child: Image.asset(
                                              'assets/images/blog-2.jpg',
                                              width: double.infinity,
                                              // height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),

                                    Container(
                                      height: screenHeight * 0.15,
                                      width: screenWidth * 0.3,
                                      color: Color(0xffF2F2F4),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: screenHeight * 0.5,
                                            width: screenWidth * 0.1,
                                            // color: Color(0xFFFF4800),
                                            child: Image.asset(
                                              'assets/images/blog-1.jpg',
                                              width: double.infinity,
                                              // height: 250,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text(
                                            "Lorem ipsum dolo sit ament\n Consec adipis elit",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 45),

                              Container(
                                // margin: EdgeInsets.only(left: 20),
                                height: screenHeight * 0.4,
                                width: screenWidth * 0.3,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-1.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 20),

                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Tag Cloud",
                                  style: GoogleFonts.mochiyPopOne(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                width: screenWidth * 0.3,
                                child: Wrap(
                                  spacing: 55,
                                  // runSpacing: 20,
                                  children: [
                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("Design"),
                                    ),

                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("Development"),
                                    ),
                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("Marketing"),
                                    ),
                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("SEO"),
                                    ),
                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("Writing"),
                                    ),
                                    Container(
                                      height: screenHeight * 0.05,
                                      // width: screenWidth * 0.06,
                                      color: Color(0xffF2F2F4),
                                      child: Text("Consulting"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: screenHeight * 0.4,
                                width: screenWidth * 0.3,
                                // color: Color(0xFFFF4800),
                                child: Image.asset(
                                  'assets/images/blog-2.jpg',
                                  width: double.infinity,
                                  // height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                child: Text(
                                  "Plain Text",
                                  style: GoogleFonts.mochiyPopOne(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(height: 25),
                              Container(
                                margin: EdgeInsets.only(left: 20),
                                height: screenHeight * 0.5,
                                width: screenWidth * 0.3,
                                color: Color(0xffF2F2F4),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Vero sea et accusam justo dolor accusam lorem consetetur, dolores sit amet sit dolor clita kasd justo, diam accusam no sea ut tempor magna takimata, amet sit et diam dolor ipsum amet diam",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Container(
                                        height: screenHeight * 0.06,
                                        width: screenWidth * 0.1,
                                        color: Color(0xFFFF4800),
                                        child: Center(
                                          child: Text(
                                            "Read More",
                                            style: TextStyle(
                                              color: Colors.white,
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
                  );
          },
        ),
      ),
    );
  }
}
