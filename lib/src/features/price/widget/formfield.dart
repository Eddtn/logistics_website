import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logistics_website/onstants/customTextField.dart';

class FormSection extends StatelessWidget {
  // bool isMobile;
  // bool isTablet;
  FormSection({
    super.key,
    //  required this.isMobile, required this.isTablet
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final bool isMobile = screenWidth <= 600;
    final bool isTablet = screenWidth > 600 && screenWidth <= 1000;
    final bool isDesktop = screenWidth > 1000;

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
      containerWidth = screenWidth * 0.30;
      containerHeight = screenHeight * 0.9;
      fieldWidth = screenWidth * 0.25;
      fontSize = 20;
    }

    return Container(
      // margin: const EdgeInsets.only(left: 50, right: 50),
      height: containerHeight,
      width: containerWidth,
      color: const Color(0xFFFF4800),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: fieldWidth,
            child: CustomTextField("your Name", hint: ''),

            //  CustomTextField("Your Name"),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: fieldWidth,
            child: CustomTextField("Your Email", hint: ""),
            //  _customTextField("Your Email"),
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
}

Widget _dropdownField() {
  double height;
  double width;
  String Value;
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
