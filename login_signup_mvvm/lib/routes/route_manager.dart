// ignore: avoid_web_libraries_in_flutter, unused_import
// import 'dart:js';


// ignore: unnecessary_import
import 'package:firstapp/View/Screens/first_app_home.dart';
import 'package:firstapp/View/Screens/loading_page.dart';
import 'package:firstapp/View/Screens/login_page.dart';
import 'package:firstapp/View/Screens/register_page.dart';

import 'package:flutter/material.dart';


class RouteManager {
  static const String loadingPage = '/';
  static const String loginPage = '/loginPage';
  static const String registerPage = 'registerPage';
  static const String firstAppHomePage = 'firstAppHomePage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      //route for loading page
      case loadingPage:
        return MaterialPageRoute(
          builder: (context) => const LoadingPage(),
        );

      //route for login page
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPage());

      //route for register page
      case registerPage:
        return MaterialPageRoute(builder: (context) => const RegisterPage());

      //route for home page
      case firstAppHomePage:
        return MaterialPageRoute(builder: (context) => const FirstAppHome());

      default:
        throw Exception("No route found!");
    }
  }
}
