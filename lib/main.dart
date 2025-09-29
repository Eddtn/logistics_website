import 'package:flutter/material.dart';
import 'package:logistics_website/src/features/Blogpages/LatestBlog.dart';
import 'package:logistics_website/src/features/Blogpages/widgets/latestblogWodget.dart';
import 'package:logistics_website/src/features/aboutPage/aboutUsPage.dart';
import 'package:logistics_website/src/features/homescreen/homescreen.dart';
import 'package:logistics_website/src/features/price/pricingPage.dart';
import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
import 'package:logistics_website/src/features/services/servicePage.dart';

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
          //  LatestBlogWidget(),
          LatestBlogScreen(),
      // ServicePageScreen(),
      // PricingPage(),
      // AboutUsPage(),
      // HomeScreen(),
    );
  }
}
