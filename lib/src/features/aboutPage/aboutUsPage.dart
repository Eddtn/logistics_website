import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/appbar.dart';
import 'package:logistics_website/onstants/floatingWidget.dart';
import 'package:logistics_website/onstants/footer.dart';
import 'package:logistics_website/pages/aboutPage/widgets/aboutUsWidget.dart';
import 'package:logistics_website/pages/aboutPage/widgets/deliveryTeamSection.dart';
import 'package:logistics_website/pages/homescreen/widgets/firsthomePage.dart';
import 'package:logistics_website/pages/services/widget/chooseUs.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
                    "About",
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
                        "About",
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
            aboutUsWidget(),
            WhyChooseUs(),
            DeliveryTeamSection(),
            FooterPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingWidget(controller: _scrollController),
    );
  }
}
