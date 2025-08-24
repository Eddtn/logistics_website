import 'package:flutter/material.dart';
import 'package:logistics_website/pages/aboutPage/aboutUsPage.dart';
import 'package:logistics_website/pages/homescreen/homescreen.dart';
import 'package:logistics_website/pages/price/pricingPage.dart';
import 'package:logistics_website/pages/price/widget/requestQuote.dart';
import 'package:logistics_website/pages/services/servicePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:
          const
          // ServicePageScreen(),
          // PricingPage(),
          // AboutUsPage(),
          HomeScreen(),
    );
  }
}
