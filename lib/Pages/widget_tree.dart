import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:krunch_app/Pages/Auth/LoginHome.dart';
import 'package:krunch_app/Pages/Home/home.dart';
import 'package:krunch_app/Services/authentication.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  Future<void> checkLoggedIn() async {
    final currentUser = await GoogleSignInApi.login();
    if (currentUser != null) {
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoggedIn ? const HomePage() : const LoginHome();
  }
}
