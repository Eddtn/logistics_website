import 'package:flutter/material.dart';

class firsthomePage extends StatelessWidget {
  final Widget child;
  double height;

  firsthomePage({super.key, required this.child, required this.height});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,

          // height: 550,
          child: Image.asset(
            'assets/images/header.jpg',
            width: double.infinity,
            // height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: height,
          // height: 550,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            color: Colors.black.withAlpha(200),
          ),
        ),

        SizedBox(
          height: 450,
          width: double.infinity,
          child: Center(child: child),
        ),
      ],
    );
  }
}
