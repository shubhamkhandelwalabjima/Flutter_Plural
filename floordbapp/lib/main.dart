import 'package:floordbapp/utils/routes.dart';
import 'package:floordbapp/widgets/homepage.dart';
import 'package:floordbapp/widgets/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AuthApp());

class AuthApp extends StatelessWidget {
  const AuthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      initialRoute: '/',
      routes: {
        MyRoutes.homeScreen: (context) => MyHomePage(),
        MyRoutes.loginScreen: (context) => LoginScreen(),
        // MyRoutes.signUp: (context) => SignUp(),
        // MyRoutes.forgotPassword: (context) => ForgotPassword(),
      },
    );
  }
}
