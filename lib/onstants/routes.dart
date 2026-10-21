import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistics_website/src/features/aboutPage/aboutUsPage.dart';
import 'package:logistics_website/src/features/admin_page/admin_auth/view/login_page.dart';
import 'package:logistics_website/src/features/homescreen/homescreen.dart';
import 'package:logistics_website/src/features/services/servicePage.dart';
import 'package:logistics_website/src/features/trackingPage/view/tracking_screen.dart';
final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const   HomeScreen();


        //  LoginPage();
        
      },
      routes: <RouteBase>[
         GoRoute(
          path: 'company',
          builder: (BuildContext context, GoRouterState state) {
            return const  AboutUsPage();
          },
        ),
         GoRoute(
          path: 'tracking',
          builder: (BuildContext context, GoRouterState state) {
            return  TrackingScreen();
          },
        ),
         GoRoute(
          path: 'services',
          builder: (BuildContext context, GoRouterState state) {
            return  ServicePageScreen();
          },
        ),
      
          
        
      ],



      
    ),
  ],
);