import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/src/features/aboutPage/widgets/aboutUsWidget.dart';
import 'package:logistics_website/src/features/aboutPage/widgets/deliveryTeamSection.dart';
import 'package:logistics_website/src/features/homescreen/widgets/blogSection.dart';
import 'package:logistics_website/src/features/homescreen/widgets/firsthomePage.dart';
import 'package:logistics_website/src/features/homescreen/widgets/testimonialWidget.dart';
import 'package:logistics_website/src/features/price/widget/pricing.dart';
import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
import 'package:logistics_website/src/features/services/widget/chooseUs.dart';
import 'package:logistics_website/src/features/services/widget/ourserviceWidget.dart';
import 'package:logistics_website/src/features/trackingPage/view/tracking_page.dart';

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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              AppBarWidget(),
              firsthomePage(
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Safe and Faster",
                          style: TextStyle(
                            color: Color(0xFFFF4800),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Center(
                        child: Text(
                          "Logistics Services",
                          style: GoogleFonts.poppins(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),

                      Consumer(
                        builder: (context, ref, child) {
                          final controller = TextEditingController();
                          final formKey = GlobalKey<FormState>();

                          return Form(
                            key: formKey,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Input
                                SizedBox(
                                  height: 50,
                                  width: 300,
                                  child: TextFormField(
                                    controller: controller,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Tracking ID',
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFFF4800),
                                          width: 2,
                                        ),
                                      ),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            horizontal: 16,
                                          ),
                                    ),
                                    validator: (v) =>
                                        v?.trim().isEmpty ?? true ? '' : null,
                                  ),
                                ),
                                const SizedBox(width: 8),

                                // Button with loading state
                                Container(
                                  height: 50,
                                  width: 100,
                                  child: Consumer(
                                    builder: (context, ref, child) {
                                      return ElevatedButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            final trackingNumber = controller
                                                .text
                                                .trim();

                                            if (trackingNumber.isEmpty) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    "Please enter a tracking number",
                                                  ),
                                                ),
                                              );
                                              return;
                                            }

                                            // ScaffoldMessenger.of(
                                            //   context,
                                            // ).showSnackBar(
                                            //   const SnackBar(
                                            //     content: Row(
                                            //       children: [
                                            //         CircularProgressIndicator(),
                                            //         Text(" Searching..."),
                                            //       ],
                                            //     ),
                                            //   ),
                                            // );

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => TrackingDetailPage(
                                                  tracking_number:
                                                      trackingNumber, // PASS THE REAL VALUE
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        child: const Text('Track & Trace'),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SizedBox(
                      //       height: 50,
                      //       width: 300,
                      //       child: TextField(
                      //         decoration: InputDecoration(
                      //           filled: true,
                      //           fillColor: Colors.white,
                      //           border: OutlineInputBorder(),
                      //           hintText: 'Tracking Id',
                      //           enabledBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //               color: Colors.white,
                      //             ), // ✅ When not focused
                      //             // borderRadius: BorderRadius.circular(8),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderSide: BorderSide(
                      //               color: Color(0xFFFF4800),
                      //               width: 2,
                      //             ), // ✅ When focused
                      //             // borderRadius: BorderRadius.circular(8),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       height: 50,
                      //       width: 150,
                      //       child: Container(
                      //         height: 50,
                      //         width: 100,
                      //         color: Color(0xFFFF4800),
                      //         child: Center(
                      //           child: Text(
                      //             'Track & Trace',
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
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
      ),
    );
  }
}
