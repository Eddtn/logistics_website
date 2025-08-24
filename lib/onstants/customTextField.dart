import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  const CustomTextField(String s, {super.key, required this.hint});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
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
          hintText: widget.hint,
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
}
