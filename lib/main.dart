import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/src/features/Blogpages/LatestBlog.dart';
import 'package:logistics_website/src/features/Blogpages/widgets/latestblogWodget.dart';
import 'package:logistics_website/src/features/aboutPage/aboutUsPage.dart';
import 'package:logistics_website/src/features/admin_page/addtracking/view/add_tracking_page.dart';
import 'package:logistics_website/src/features/admin_page/admin_auth/view/login_page.dart';
import 'package:logistics_website/src/features/admin_page/views/admin_page.dart';
import 'package:logistics_website/src/features/homescreen/homescreen.dart';
import 'package:logistics_website/src/features/price/pricingPage.dart';
import 'package:logistics_website/src/features/price/widget/requestQuote.dart';
import 'package:logistics_website/src/features/services/servicePage.dart';
import 'package:logistics_website/src/features/trackingPage/view/tracking_page.dart';

// void main() {
//   runApp(ProviderScope(child: const MyApp()));
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:logistics_website/src/features/admin_page/admin_auth/view/login_page.dart';
import 'package:logistics_website/src/features/admin_page/views/admin_page.dart';
// import 'package:logistics_website/src/features/admin_page/admin_auth/provider/auth_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Initialize Supabase once here
  await Supabase.initialize(
    url: "https://kzeymxnrejtjfmadfurb.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0",
  );

  runApp(const ProviderScope(child: MyApp()));
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
      home: LoginPage(),
      // TrackingDetailsPage(trackingId: '', trackingNumber: ''),
      // AdminPanel(),
      // const LatestBlogWidget(),
      // LatestBlogScreen(),
      // ServicePageScreen(),
      // PricingPage(),
      // AboutUsPage(),
      // HomeScreen(),
    );
  }
}
