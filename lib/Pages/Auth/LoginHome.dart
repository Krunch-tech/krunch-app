import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:krunch_app/Pages/Auth/LoginEmail.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xffF2F4F6)),
          Column(
            children: [
              SizedBox(height: 145),
              Center(
                  child: Text("Krunch",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                          letterSpacing: -1.5,
                          color: Colors.black))),
              Expanded(child: SizedBox(height: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff6271FF)),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_rounded,
                                color: Colors.white, size: 22),
                            SizedBox(width: 11),
                            Text(
                              "Continue with Email",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro'),
                            )
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginEmail()));
                        },
                      ),
                    ),
                    SizedBox(height: 16),

                    /// Apple
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black),
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Ionicons.logo_apple, color: Colors.white),
                            SizedBox(width: 11),
                            Text(
                              "Continue with Apple",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro'),
                            )
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(height: 16),

                    /// google + facebook
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 9, 0, 9),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.logo_google, color: Colors.red),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(
                                    color: Colors.grey.shade400, width: 1),
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.logo_facebook,
                                      color: Colors.blue, size: 26),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),

                    /// Bottom Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By continuing you agree to Krunch’s ",
                            style: Theme.of(context).textTheme.bodyText2),
                        Text("Terms of Service",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("and ",
                            style: Theme.of(context).textTheme.bodyText2),
                        Text("Privacy Policy",
                            style:
                                TextStyle(decoration: TextDecoration.underline))
                      ],
                    ),
                    SizedBox(height: 122)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
