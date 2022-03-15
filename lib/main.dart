import 'package:flutter/material.dart';
import 'package:krunch_app/Pages/Auth/LoginHome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginHome(),
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 20.0,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.bold,
                color: Color(0xff6271FF)),
            bodyText2: TextStyle(
              fontSize: 14,
              color: Color(0xffC5C5C7),
              fontFamily: 'SF Pro Display',
            )),
      ),
    );
  }
}
