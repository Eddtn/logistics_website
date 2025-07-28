import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/pages/homescreen/widgets/animatebutton.dart';
import 'package:logistics_website/pages/homescreen/widgets/teamWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   final screenSize = MediaQuery.of(context).size;
    //   print('Screen width: ${screenSize.width}, height: ${screenSize.height}');
    // });
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
    // final bool isMobile = constraints.maxWidth < 900;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AppBarWidget(),
            Stack(
              children: [
                Container(
                  height: 550,

                  child: Image.asset(
                    'assets/images/header.jpg',
                    width: double.infinity,
                    // height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.symmetric(
                  //   horizontal: 8,
                  //   vertical: 24,
                  // ),
                  height: 550,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(200),
                  ),
                ),

                SizedBox(
                  height: 450,
                  width: double.infinity,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Safe and Faster",
                          style: TextStyle(
                            color: Color(0xFFFF4800),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          "Logistics Services",
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 50,
                              width: 300,
                              child: TextField(
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: 'Tracking Id',
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
                              width: 150,
                              child: Container(
                                height: 50,
                                width: 100,
                                color: Color(0xFFFF4800),
                                child: Center(
                                  child: Text(
                                    'Track & Trace',
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
              ],
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final screenHeight = MediaQuery.of(context).size.height;
                final bool isMobile = constraints.maxWidth < 900;

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
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            /// LEFT COLUMN (Image and Strip)
                            Flexible(
                              flex: 1,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 40, top: 40),
                                    height: 350,
                                    width: constraints.maxWidth * 0.4,
                                    child: Image.asset(
                                      'assets/images/about.jpg',
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 40),
                                    height: 50,
                                    width: constraints.maxWidth * 0.4,
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
            ),
            SizedBox(height: screenHeight * 0.1),

            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                final bool isMobile = screenWidth <= 600;
                final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
                final bool isDesktop = screenWidth > 1000;

                return isDesktop
                    ? Container(
                        height: screenHeight * 0.7,
                        // margin: EdgeInsets.all(20),
                        color: Color(0xffF2F2F4),

                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildTextSection(isMobile)),
                            const SizedBox(width: 30),
                            Expanded(
                              child: _buildFormSection(isMobile, isTablet),
                            ),
                          ],
                        ),
                      )
                    : isTablet
                    ? Container(
                        color: Color(0xffF2F2F4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                _buildTextSection(isMobile),
                                // const SizedBox(width: 20),
                                _buildFormSection(isMobile, isTablet),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Container(
                        // height: screenHeight * 0.8,
                        color: Color(0xffF2F2F4),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: _buildTextSection(isMobile),
                            ),
                            const SizedBox(height: 30),
                            _buildFormSection(isMobile, isTablet),
                          ],
                        ),
                      );
              },
            ),

            // LayoutBuilder(
            //   builder: (context, constraints) {
            //     // final screenWidth = MediaQuery.of(context).size.width;
            //     // final screenHeight = MediaQuery.of(context).size.height;
            //     // final bool isMobile = constraints.maxWidth < 900;
            //     double screenWidth = constraints.maxWidth;
            //     final bool isMobile = screenWidth <= 600;
            //     final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
            //     final bool isDesktop = screenWidth > 1000;

            //     return isMobile
            //         ? Container(
            //             margin: EdgeInsets.all(15),
            //             height: screenHeight * 1.5,
            //             child: Column(
            //               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   "OUR SERVICES",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 22,
            //                     fontWeight: FontWeight.w600,
            //                     color: Color(0xFFFF4800),
            //                   ),
            //                 ),
            //                 Text(
            //                   "Best Logistics Services",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 30,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //                 SizedBox(height: 20),
            //                 Container(
            //                   margin: EdgeInsets.all(20),
            //                   child: Column(
            //                     mainAxisAlignment:
            //                         MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       _serviceBlock(
            //                         _container(
            //                           Icon(Icons.airplanemode_active_outlined),
            //                           "Air Flight",
            //                         ),
            //                         "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                         "Read More",
            //                       ),
            //                       SizedBox(width: 15),

            //                       _serviceBlock(
            //                         _container(
            //                           Icon(Icons.airplanemode_on_sharp),
            //                           "Air Flight",
            //                         ),
            //                         "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                         "Read More",
            //                       ),
            //                       SizedBox(width: 10),
            //                       _serviceBlock(
            //                         _container(
            //                           Icon(Icons.airplanemode_on_sharp),
            //                           "Air Flight",
            //                         ),
            //                         "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                         "Read More",
            //                       ),
            //                       SizedBox(width: 10),
            //                       _serviceBlock(
            //                         _container(
            //                           Icon(Icons.airplanemode_active_outlined),
            //                           "Air Flight",
            //                         ),
            //                         "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                         "Read More",
            //                       ),
            //                     ],
            //                   ),
            //                 ),

            //                 // SizedBox(width: 20),
            //               ],
            //             ),
            //           )
            //         : Container(
            //             height: screenHeight * 0.7,

            //             child: Column(
            //               children: [
            //                 Text(
            //                   "OUR SERVICES",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 22,
            //                     fontWeight: FontWeight.w600,
            //                     color: Color(0xFFFF4800),
            //                   ),
            //                 ),
            //                 Text(
            //                   "Best Logistics Services",
            //                   style: GoogleFonts.poppins(
            //                     fontSize: 35,
            //                     fontWeight: FontWeight.bold,
            //                     color: Colors.black,
            //                   ),
            //                 ),
            //                 SizedBox(height: 10),
            //                 Container(
            //                   margin: EdgeInsets.all(40),
            //                   child: Row(
            //                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       Flexible(
            //                         child: _serviceBlock(
            //                           _container(
            //                             Icon(
            //                               Icons.airplanemode_active_outlined,
            //                             ),
            //                             "Air Flight",
            //                           ),
            //                           "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                           "Read More",
            //                         ),
            //                       ),
            //                       SizedBox(width: 10),

            //                       Flexible(
            //                         child: _serviceBlock(
            //                           _container(
            //                             Icon(Icons.airplanemode_on_sharp),
            //                             "Air Flight",
            //                           ),
            //                           "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                           "Read More",
            //                         ),
            //                       ),
            //                       SizedBox(width: 10),
            //                       Flexible(
            //                         child: _serviceBlock(
            //                           _container(
            //                             Icon(Icons.airplanemode_on_sharp),
            //                             "Air Flight",
            //                           ),
            //                           "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                           "Read More",
            //                         ),
            //                       ),
            //                       SizedBox(width: 10),
            //                       Flexible(
            //                         child: _serviceBlock(
            //                           _container(
            //                             Icon(
            //                               Icons.airplanemode_active_outlined,
            //                             ),
            //                             "Air Flight",
            //                           ),
            //                           "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
            //                           "Read More",
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 ),

            //                 SizedBox(width: 20),
            //               ],
            //             ),
            //           );
            //   },
            // ),
            // LayoutBuilder(
            //   builder: (context, constraints) {
            //     double screenWidth = constraints.maxWidth;
            //     final bool isMobile = screenWidth <= 600;
            //     final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
            //     final bool isDesktop = screenWidth > 1000;

            //     return isDesktop
            //         ? Container(
            //             height: screenHeight * 0.7,

            //             child: _buildContainerSection(isMobile, isTablet),
            //           )
            //         : isTablet
            //         ? Container(
            //             child: _buildContainerSection(isMobile, isTablet),
            //           )
            //         : Container(
            //             // height: screenHeight * 0.8,
            //             color: Color(0xffF2F2F4),

            //             child: _buildContainerSection(isMobile, isTablet),
            //           );
            //   },
            // ),

            ////TEST/////////////
            ///
            ///
            LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                final bool isMobile = screenWidth <= 600;
                final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
                final bool isDesktop = screenWidth > 1000;

                return isDesktop
                    ? Container(
                        color: isMobile ? const Color(0xffF2F2F4) : null,
                        height: isDesktop ? screenHeight * 0.6 : null,
                        // padding: const EdgeInsets.all(30),
                        margin: EdgeInsets.all(40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          color: const Color(0xFFFF4800),
                                          // padding: const EdgeInsets.symmetric(
                                          //   horizontal: 16,
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons
                                                    .airplanemode_active_outlined,
                                                color: Colors.white,
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
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          color: const Color(0xFFFF4800),
                                          // padding: const EdgeInsets.symmetric(
                                          //   horizontal: 16,
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons
                                                    .airplanemode_active_outlined,
                                                color: Colors.white,
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
                                ),
                                SizedBox(width: 5),
                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          color: const Color(0xFFFF4800),
                                          // padding: const EdgeInsets.symmetric(
                                          //   horizontal: 16,
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons
                                                    .airplanemode_active_outlined,
                                                color: Colors.white,
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
                                ),
                                SizedBox(width: 5),

                                Flexible(
                                  flex: 1,
                                  child: Container(
                                    width: 300,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 80,
                                          color: const Color(0xFFFF4800),
                                          // padding: const EdgeInsets.symmetric(
                                          //   horizontal: 16,
                                          // ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons
                                                    .airplanemode_active_outlined,
                                                color: Colors.white,
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : isTablet
                    ? Container(
                        color: isMobile ? const Color(0xffF2F2F4) : null,
                        height: isDesktop ? screenHeight * 0.7 : null,
                        padding: const EdgeInsets.all(20),
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
                            SizedBox(
                              height: isMobile
                                  ? 900
                                  : 500, // Adjust based on expected content
                              child: GridView.count(
                                crossAxisCount: 2,

                                //  isMobile
                                //     ? 1
                                //     : isTablet
                                //     ? 2
                                //     : 4,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1.75,
                                physics: const NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  4,
                                  (index) => _serviceCard(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        color: isMobile ? const Color(0xffF2F2F4) : null,
                        height: isDesktop ? screenHeight * 0.9 : null,
                        padding: const EdgeInsets.all(20),
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
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    color: const Color(0xFFFF4800),
                                    // padding: const EdgeInsets.symmetric(
                                    //   horizontal: 16,
                                    // ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active_outlined,
                                          color: Colors.white,
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

                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    color: const Color(0xFFFF4800),
                                    // padding: const EdgeInsets.symmetric(
                                    //   horizontal: 16,
                                    // ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active_outlined,
                                          color: Colors.white,
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

                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    color: const Color(0xFFFF4800),
                                    // padding: const EdgeInsets.symmetric(
                                    //   horizontal: 16,
                                    // ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active_outlined,
                                          color: Colors.white,
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

                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    color: const Color(0xFFFF4800),
                                    // padding: const EdgeInsets.symmetric(
                                    //   horizontal: 16,
                                    // ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active_outlined,
                                          color: Colors.white,
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
                          ],
                        ),
                      );
              },
            ),

            ///////WHY CHOOSE US///////
            ///
            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final screenHeight = MediaQuery.of(context).size.height;
                final bool isMobile = constraints.maxWidth < 900;

                return isMobile
                    ? Container(
                        height: screenHeight * 2.55,
                        color: Color(0xfff2f2f4),
                        // color: Colors.amber,
                        child: Column(
                          children: [
                            /// LEFT COLUMN (Image and Strip)
                            Container(
                              // margin: EdgeInsets.only(left: 40),
                              height: screenHeight * 1.55,
                              width: screenWidth * 0.85,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // height: screenHeight * 0.9,
                          color: Color(0xfff2f2f4),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
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
            ),

            LayoutBuilder(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                        fontWeight:
                                                            FontWeight.bold,
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
                          padding: const EdgeInsets.all(8.0),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        height: screenHeight * 0.8,
                                        width: screenHeight * 0.65,
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 45,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.grey[700],
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
                                            Text(
                                              "Compatible With All Browsers",
                                            ),
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
                                        width: screenHeight * 0.65,
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 45,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.grey[700],
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
                                            Text(
                                              "Compatible With All Browsers",
                                            ),
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
                                        width: screenHeight * 0.65,
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
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 45,
                                                            fontWeight:
                                                                FontWeight.bold,
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.grey[700],
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
                                            Text(
                                              "Compatible With All Browsers",
                                            ),
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
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                final screenWidth = MediaQuery.of(context).size.width;
                final screenHeight = MediaQuery.of(context).size.height;

                final bool isMobile = screenWidth <= 600;
                final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
                final bool isDesktop = screenWidth > 1000;

                return isMobile
                    ? Container(
                        height: screenHeight * 2.9,
                        // margin: EdgeInsets.only(top: 30),
                        // padding: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "DELIVERY TEAM",
                                style: TextStyle(
                                  color: Color(0xFFFF4800),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Meet Our Delivery Team",
                                style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(40),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-1.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),

                                    SizedBox(height: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-2.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),

                                    SizedBox(width: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-3.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                    SizedBox(height: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-4.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : isTablet
                    ? Container(
                        height: screenHeight * 0.9,
                        // margin: EdgeInsets.only(top: 30),
                        // padding: EdgeInsets.all(20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "DELIVERY TEAM",
                                style: TextStyle(
                                  color: Color(0xFFFF4800),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Meet Our Delivery Team",
                                style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height:
                                    screenHeight *
                                    0.9, // Adjust based on expected content
                                child: GridView.count(
                                  crossAxisCount: 2,
                                  //  isMobile
                                  //     ? 1
                                  //     : isTablet
                                  //     ? 2
                                  //     : 4,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 1.75,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: [
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-1.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-2.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-3.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-4.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "DELIVERY TEAM",
                                style: TextStyle(
                                  color: Color(0xFFFF4800),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Meet Our Delivery Team",
                                style: GoogleFonts.poppins(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(40),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-1.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),

                                    SizedBox(width: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-2.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),

                                    SizedBox(width: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-3.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                    SizedBox(width: 10),
                                    HoverCardWithPeek(
                                      imagePath: 'assets/images/team-4.jpg',
                                      name: 'Full Name',
                                      designation: 'Designation',
                                      height: screenHeight * 0.2,
                                      width: screenHeight * 0.4,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
            Container(height: 400, color: Colors.grey),
          ],
        ),
      ),

      // FAB with fade and custom icon
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: _showFab ? 1.0 : 0.0,
        child: _showFab
            ? SizedBox(
                height: 56,
                width: 56,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFFF4800),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero, // custom shape
                  ),
                  onPressed: () {
                    _scrollController.animateTo(
                      0,
                      duration: Duration(milliseconds: 600),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    color: Colors.white,
                    size: 28,
                  ), // custom icon
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }

  Widget _serviceCard() {
    return SizedBox(
      // height: 300,
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            color: const Color(0xFFFF4800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.airplanemode_active_outlined, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Air Freight",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Flexible(
            child: Text(
              "Diam amet eos at no eos sit lorem, amet rebum ipsum clita stet diam sea est diam",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
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
    );
  }

  Widget _buildTextSection(bool isMobile) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "GET A QUOTE",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFFFF4800),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Request A Free Quote",
            style: GoogleFonts.poppins(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Dolores lorem lorem ipsum sit et ipsum. Sadip sea amet diam dolore sed et. Sit rebum labore sit sit ut vero no sit. Et elitr stet dolor sed sit et sed ipsum et kasd ut. Erat duo eos et erat sed diam duo ",
            style: GoogleFonts.poppins(fontSize: 14),
          ),

          const SizedBox(height: 30),

          // 👇 Responsive stats layout
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _statBlock("225", "Skilled Experts"),
                    SizedBox(height: 15),
                    _statBlock("1050", "Happy Clients"),
                    SizedBox(height: 15),
                    _statBlock("2500", "Complete Projects"),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // spacing: 20,
                  // runSpacing: 20,
                  children: [
                    _statBlock("225", "Skilled Experts"),
                    _statBlock("1050", "Happy Clients"),
                    _statBlock("2500", "Complete Projects"),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _serviceBlock(Widget _container, String label1, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _container,
        const SizedBox(height: 10),

        Text(
          label1,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            label2,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFF4800),
            ),
          ),
        ),
      ],
    );
  }

  Widget _statBlock(String number, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF4800),
          ),
        ),

        const SizedBox(height: 4),

        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection(bool isMobile, bool isTablet) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double containerWidth;
    double containerHeight;
    double fieldWidth;
    double fontSize;

    if (isMobile) {
      containerWidth = screenWidth * 0.9;
      containerHeight = screenHeight * 0.6;
      fieldWidth = screenWidth * 0.75;
      fontSize = 16;
    } else if (isTablet) {
      containerWidth = screenWidth * 0.9;
      containerHeight = screenHeight * 0.65;
      fieldWidth = screenWidth * 0.50;
      fontSize = 18;
    } else {
      containerWidth = screenWidth * 0.35;
      containerHeight = screenHeight * 0.9;
      fieldWidth = screenWidth * 0.3;
      fontSize = 20;
    }

    return Container(
      margin: const EdgeInsets.only(left: 50, right: 50),
      height: containerHeight,
      width: containerWidth,
      color: const Color(0xFFFF4800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: fieldWidth,
            child: _customTextField("Your Name"),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: fieldWidth,
            child: _customTextField("Your Email"),
          ),
          const SizedBox(height: 20),
          SizedBox(height: 50, width: fieldWidth, child: _dropdownField()),
          const SizedBox(height: 25),
          Container(
            height: 50,
            width: fieldWidth,
            color: const Color(0xff1F1F2E),
            child: Center(
              child: Text(
                "Get a Quote",
                style: GoogleFonts.poppins(
                  fontSize: fontSize,
                  color: const Color(0xffBEEAFF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFormSection(bool isMobile) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   return Column(
  //     children: [
  //       Container(

  //         margin: EdgeInsets.all(25),
  //         height: screenHeight * 0.65,
  //         width: screenWidth * 1.32,
  //         color: Color(0xFFFF4800),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(
  //               height: 50,
  //               width: screenWidth * 0.65,
  //               child: _customTextField("Your Phone"),
  //             ),
  //             SizedBox(
  //               height: 50,
  //               width: screenWidth * 0.65,
  //               child: _customTextField("Your Phone"),
  //             ),

  //             SizedBox(
  //               height: 50,
  //               width: screenWidth * 0.65,
  //               child: _customTextField("Your Phone"),
  //             ),

  //             Container(
  //               height: screenHeight * 0.07,
  //               width: screenWidth * 0.65,
  //               color: Color(0xff1F1F2E),
  //               child: Center(
  //                 child: Text(
  //                   "Get a Quote",
  //                   style: GoogleFonts.poppins(
  //                     fontSize: screenWidth * 0.045,
  //                     color: Color(0xffBEEAFF),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
  // Widget _buildFormSection(bool isMobile) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   return Container(
  //     height: screenHeight * 0.65,
  //     // width: constraints.maxWidth * 0.32,
  //     color: Color(0xFFFF4800),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           height: 50,
  //           width: 300,
  //           child: _customTextField("Your Name"),
  //         ),

  //         const SizedBox(height: 5),
  //         SizedBox(child: _customTextField("Your Email")),
  //         const SizedBox(height: 15),
  //         SizedBox(child: _dropdownField()),
  //         const SizedBox(height: 5),
  //         // const SizedBox(height: 20),

  //         // SizedBox(
  //         //   width: double.infinity,
  //         //   height: 50,
  //         //   child: ElevatedButton(
  //         //     style: ElevatedButton.styleFrom(
  //         //       backgroundColor: const Color(0xFFFF4800),
  //         //     ),
  //         //     onPressed: () {},
  //         //     child: const Text("Submit"),
  //         //   ),
  //         // ),
  //         Container(
  //           height: screenHeight * 0.07,
  //           width: double.infinity,
  //           color: Color(0xff1F1F2E),
  //           child: Center(
  //             child: Text(
  //               "Get a Quote",
  //               style: GoogleFonts.poppins(
  //                 // fontSize: screenWidth * 0.045,
  //                 color: Color(0xffBEEAFF),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _customTextField(String hint) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // double screenWidth = constraints.maxWidth;
    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

    double containerWidth;
    double containerHeight;
    double fieldWidth;
    double fontSize;

    if (isMobile) {
      containerWidth = screenWidth * 0.95;
      containerHeight = screenHeight * 0.75;
      fieldWidth = screenWidth * 0.85;
      fontSize = 16;
    } else if (isTablet) {
      containerWidth = screenWidth * 0.70;
      containerHeight = screenHeight * 0.7;
      fieldWidth = screenWidth * 0.60;
      fontSize = 18;
    } else {
      containerWidth = screenWidth * 0.5;
      containerHeight = screenHeight * 0.65;
      fieldWidth = screenWidth * 0.4;
      fontSize = 20;
    }
    return SizedBox(
      height: containerHeight,
      width: containerWidth,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white), // ✅ When not focused
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
    );
  }

  Widget _dropdownField() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(border: InputBorder.none),
        value: null,
        hint: const Text("Select Service"),
        items: const [
          DropdownMenuItem(value: "design", child: Text("UI/UX Design")),
          DropdownMenuItem(value: "dev", child: Text("App Development")),
          DropdownMenuItem(value: "data", child: Text("Data Analysis")),
        ],
        onChanged: (value) {},
      ),
    );
  }
}
