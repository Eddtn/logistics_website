import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistics_website/core/appp_theme.dart';
import 'package:logistics_website/core/theme_switch.dart';

import 'package:logistics_website/src/features/admin_page/admin_auth/view/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/widgets/language_switchers.dart';
import 'l10n/localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Initialize Supabase once here
  await Supabase.initialize(
    url: "https://kzeymxnrejtjfmadfurb.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt6ZXlteG5yZWp0amZtYWRmdXJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTk1MjM1OTcsImV4cCI6MjA3NTA5OTU5N30.QpuUzEffmte3ZO9-6CMK4PwWFP9nBtFWJ-W0e5g91A0",
  );

  // runApp(const ProviderScope(child: MyApp()));
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(child: MyApp()),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeModeProvider);

    final appLocale = ref.watch(localeProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      locale: DevicePreview.locale(context) ?? appLocale,
      supportedLocales: Localization.supportedLocales,
      localizationsDelegates: Localization.localizationsDelegates,
      // theme:
      //  ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      // ),
      home:
          //  HomeScreen(),
          //  TrackingDetailsPage(trackingNumber: ''),
          LoginPage(),
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
