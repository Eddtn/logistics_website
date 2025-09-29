import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:logistics_website/onstants/floatingWidget.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/onstants/pagechange.dart';
import 'package:logistics_website/onstants/responsiveness.dart';
import 'package:logistics_website/src/features/Blogpages/widgets/latestblogWodget.dart';
import 'package:logistics_website/src/features/homescreen/widgets/blogSection.dart';
import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';

class LatestBlogScreen extends StatefulWidget {
  const LatestBlogScreen({super.key});

  @override
  State<LatestBlogScreen> createState() => _LatestBlogScreenState();
}

class _LatestBlogScreenState extends State<LatestBlogScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenSize = MediaQuery.of(context).size;
      print('Screen width: ${screenSize.width}, height: ${screenSize.height}');
    });
  }

  void _scrollListener() {
    if (_scrollController.offset > 200 && !_showFab) {
      setState(() => _showFab = true);
    } else if (_scrollController.offset <= 200 && _showFab) {
      setState(() => _showFab = false);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AppBarWidget(),

            firsthomePage(
              height: 350,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Latest Blog",
                    style: GoogleFonts.poppins(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Home",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.circle_sharp, color: Colors.white, size: 15),
                      SizedBox(width: 10),

                      Text(
                        "Blog",
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Spacer(),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(40),
              // height: screenHeight * 3.9,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        BlogContainerwidget(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth * 1,
                          containerImage: 'assets/images/blog-1.jpg',
                          profileImage: 'assets/images/user.jpg',
                          name: 'John Doe',
                          jobTitle: "Web Design",
                          heading: "Kasd tempor diam sea justo dolor",
                          comments:
                              "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
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
                              "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
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
                              "Dolor sea ipsum ipsum et. Erat duo lorem magna vero dolor dolores. Rebum eirmod no dolor diam dolor amet ipsum. Lorem lorem sea sed diam est lorem magna",
                        ),
                      ],
                    ),
                  ),

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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      style: TextStyle(color: Colors.white),
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

            // LatestBlogWidget(),
            // BlogSection(),
            FooterPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingWidget(controller: _scrollController),
    );
  }
}
