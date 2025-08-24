import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/customIcons.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/pages/aboutPage/widgets/aboutUsWidget.dart';
import 'package:logistics_website/pages/aboutPage/widgets/deliveryTeamSection.dart';
import 'package:logistics_website/pages/homescreen/widgets/animatebutton.dart';
import 'package:logistics_website/pages/homescreen/widgets/blogSection.dart';
import 'package:logistics_website/pages/homescreen/widgets/firsthomePage.dart';
import 'package:logistics_website/pages/homescreen/widgets/teamWidget.dart';
import 'package:logistics_website/pages/homescreen/widgets/testimonialWidget.dart';
import 'package:logistics_website/pages/price/widget/getaquotewidget.dart';
import 'package:logistics_website/pages/price/widget/pricing.dart';
import 'package:logistics_website/pages/price/widget/requestQuote.dart';
import 'package:logistics_website/pages/services/widget/chooseUs.dart';
import 'package:logistics_website/pages/services/widget/ourserviceWidget.dart';
import 'package:logistics_website/pages/services/widget/serviceWidget.dart';

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
    // final bool isMobile = constraints.maxWidth < 900;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            AppBarWidget(),
            firsthomePage(
              height: 550,
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

            aboutUsWidget(),

            // SizedBox(height: screenHeight * 0.1),
            RequestQuoteWidget(),
            // OurService(),
            OurServiceWidget(),

            ///////WHY CHOOSE US///////
            ///
            WhyChooseUs(),

            PricingSection(),

            DeliveryTeamSection(),

            TestimonySection(),

            BlogSection(),

            FooterPage(),
          ],
        ),
      ),

      // FAB with fade and custom icon
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: _showFab ? 1.0 : 0.0,
        child: _showFab
            ? SizedBox(
                height: 50,
                width: 50,
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

  // LayoutBuilder getaquotewidget(double screenHeight) {
  //   return LayoutBuilder(
  //           builder: (context, constraints) {
  //             double screenWidth = constraints.maxWidth;
  //             final bool isMobile = screenWidth <= 600;
  //             final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
  //             final bool isDesktop = screenWidth > 1000;

  //             return isDesktop
  //                 ? Container(
  //                     height: screenHeight * 0.7,
  //                     // margin: EdgeInsets.all(20),
  //                     color: Color(0xffF2F2F4),

  //                     child: Row(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Expanded(child: _buildTextSection(isMobile)),
  //                         const SizedBox(width: 30),
  //                         Expanded(
  //                           child: _buildFormSection(isMobile, isTablet),
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 : isTablet
  //                 ? Container(
  //                     color: Color(0xffF2F2F4),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Column(
  //                           children: [
  //                             _buildTextSection(isMobile),
  //                             // const SizedBox(width: 20),
  //                             _buildFormSection(isMobile, isTablet),
  //                           ],
  //                         ),
  //                       ],
  //                     ),
  //                   )
  //                 : Container(
  //                     // height: screenHeight * 0.8,
  //                     color: Color(0xffF2F2F4),

  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: _buildTextSection(isMobile),
  //                         ),
  //                         const SizedBox(height: 30),
  //                         _buildFormSection(isMobile, isTablet),
  //                       ],
  //                     ),
  //                   );
  //           },
  //         );
  // }

  // Widget _serviceBlock(Widget _container, String label1, String label2) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       _container,
  //       const SizedBox(height: 10),

  //       Text(
  //         label1,
  //         style: GoogleFonts.poppins(
  //           fontSize: 14,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xff000000),
  //         ),
  //       ),
  //       const SizedBox(height: 10),
  //       Center(
  //         child: Text(
  //           label2,
  //           style: GoogleFonts.poppins(
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold,
  //             color: Color(0xFFFF4800),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildFormSection(bool isMobile, bool isTablet) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;

  //   double containerWidth;
  //   double containerHeight;
  //   double fieldWidth;
  //   double fontSize;

  //   if (isMobile) {
  //     containerWidth = screenWidth * 0.9;
  //     containerHeight = screenHeight * 0.6;
  //     fieldWidth = screenWidth * 0.75;
  //     fontSize = 16;
  //   } else if (isTablet) {
  //     containerWidth = screenWidth * 0.9;
  //     containerHeight = screenHeight * 0.65;
  //     fieldWidth = screenWidth * 0.50;
  //     fontSize = 18;
  //   } else {
  //     containerWidth = screenWidth * 0.35;
  //     containerHeight = screenHeight * 0.9;
  //     fieldWidth = screenWidth * 0.3;
  //     fontSize = 20;
  //   }

  //   return Container(
  //     margin: const EdgeInsets.only(left: 50, right: 50),
  //     height: containerHeight,
  //     width: containerWidth,
  //     color: const Color(0xFFFF4800),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         SizedBox(
  //           height: 50,
  //           width: fieldWidth,
  //           child: _customTextField("Your Name"),
  //         ),
  //         const SizedBox(height: 20),
  //         SizedBox(
  //           height: 50,
  //           width: fieldWidth,
  //           child: _customTextField("Your Email"),
  //         ),
  //         const SizedBox(height: 20),
  //         SizedBox(height: 50, width: fieldWidth, child: _dropdownField()),
  //         const SizedBox(height: 25),
  //         Container(
  //           height: 50,
  //           width: fieldWidth,
  //           color: const Color(0xff1F1F2E),
  //           child: Center(
  //             child: Text(
  //               "Get a Quote",
  //               style: GoogleFonts.poppins(
  //                 fontSize: fontSize,
  //                 color: const Color(0xffBEEAFF),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _customTextField(String hint) {
  //   final screenWidth = MediaQuery.of(context).size.width;
  //   final screenHeight = MediaQuery.of(context).size.height;
  //   // double screenWidth = constraints.maxWidth;
  //   final bool isMobile = screenWidth <= 600;
  //   final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
  //   final bool isDesktop = screenWidth > 1000;

  //   double containerWidth;
  //   double containerHeight;
  //   double fieldWidth;
  //   double fontSize;

  //   if (isMobile) {
  //     containerWidth = screenWidth * 0.95;
  //     containerHeight = screenHeight * 0.75;
  //     fieldWidth = screenWidth * 0.85;
  //     fontSize = 16;
  //   } else if (isTablet) {
  //     containerWidth = screenWidth * 0.70;
  //     containerHeight = screenHeight * 0.7;
  //     fieldWidth = screenWidth * 0.60;
  //     fontSize = 18;
  //   } else {
  //     containerWidth = screenWidth * 0.5;
  //     containerHeight = screenHeight * 0.65;
  //     fieldWidth = screenWidth * 0.4;
  //     fontSize = 20;
  //   }
  //   return SizedBox(
  //     height: containerHeight,
  //     width: containerWidth,
  //     child: TextField(
  //       decoration: InputDecoration(
  //         filled: true,
  //         fillColor: Colors.white,
  //         border: OutlineInputBorder(),
  //         hintText: hint,
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.white), // ✅ When not focused
  //           // borderRadius: BorderRadius.circular(8),
  //         ),
  //         focusedBorder: OutlineInputBorder(
  //           borderSide: BorderSide(
  //             color: Color(0xFFFF4800),
  //             width: 2,
  //           ), // ✅ When focused
  //           // borderRadius: BorderRadius.circular(8),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // Widget _dropdownField() {
  //   double height;
  //   double width;
  //   String Value;
  //   return Container(
  //     height: 50,
  //     padding: const EdgeInsets.symmetric(horizontal: 12),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: Colors.white),
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: DropdownButtonFormField<String>(
  //       decoration: const InputDecoration(border: InputBorder.none),
  //       value: null,
  //       hint: const Text("Select Service"),
  //       items: const [
  //         DropdownMenuItem(value: "design", child: Text("UI/UX Design")),
  //         DropdownMenuItem(value: "dev", child: Text("App Development")),
  //         DropdownMenuItem(value: "data", child: Text("Data Analysis")),
  //       ],
  //       onChanged: (value) {},
  //     ),
  //   );
  // }

  // Widget dropText() {
  //   double? height;
  //   double width;
  //   String? Value;
  //   Widget? hintText;
  //   Widget child = Text('');
  //   return Container(
  //     height: height,
  //     padding: const EdgeInsets.symmetric(horizontal: 12),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       border: Border.all(color: Colors.white),
  //       borderRadius: BorderRadius.circular(4),
  //     ),
  //     child: DropdownButtonFormField<String>(
  //       decoration: const InputDecoration(border: InputBorder.none),
  //       value: null,
  //       hint: hintText,
  //       items: [
  //         DropdownMenuItem(value: Value, child: child),
  //         DropdownMenuItem(value: Value, child: child),
  //         DropdownMenuItem(value: Value, child: child),
  //       ],
  //       onChanged: (value) {},
  //     ),
  //   );
  // }
}
