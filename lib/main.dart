// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:krunch_app/Models/database.dart';
import 'package:krunch_app/Pages/Splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'Provider/api_call.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ApiCall()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreenPage(),
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 20.0,
              fontFamily: 'SF Pro Display',
              fontWeight: FontWeight.bold,
              color: Color(0xff6271FF),
            ),
            bodyMedium: TextStyle(
              fontSize: 14,
              color: Color(0xffC5C5C7),
              fontFamily: 'SF Pro Display',
            ),
          ),
        ),
      ),
    );
  }
}
