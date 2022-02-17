import 'package:flutter/material.dart';
import 'package:krunch_app/Pages/home.dart';

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
      home: HomePage(),
      theme: ThemeData(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
                fontSize: 20.0,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.bold,
                color: Color(0xff6271FF)),
            bodyText2: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            )),
      ),
    );
  }
}