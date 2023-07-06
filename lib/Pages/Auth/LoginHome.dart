// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '/Pages/Home/home.dart';
import '/Services/authentication.dart';
import '/Pages/Auth/LoginEmail.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future googleSignIn() async {
      await GoogleSignInApi.login().then((value) {
        if (value != null) {
          return Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (value == null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Sign in failed')));
        }
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xffF2F4F6)),
          Column(
            children: [
              const SizedBox(height: 145),
              const Center(
                  child: Text("Krunch",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 34,
                          letterSpacing: -1.5,
                          color: Colors.black))),
              const Expanded(child: SizedBox(height: 1)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xff6271FF)),
                      child: TextButton(
                        child: const Row(
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
                                  builder: (context) => const LoginEmail()));
                        },
                      ),
                    ),
                    const SizedBox(height: 16),

                    /// Apple
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.black),
                      child: TextButton(
                        child: const Row(
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
                    const SizedBox(height: 16),

                    /// google + facebook
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: googleSignIn,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade400, width: 1),
                                  color: Colors.white),
                              child: const Padding(
                                padding: EdgeInsets.fromLTRB(0, 9, 0, 9),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Ionicons.logo_google,
                                        color: Colors.red),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Expanded(
                        //   child: InkWell(
                        //     onTap: facebookSignIn,
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //           borderRadius: const BorderRadius.all(
                        //             Radius.circular(10),
                        //           ),
                        //           border: Border.all(
                        //               color: Colors.grey.shade400, width: 1),
                        //           color: Colors.white),
                        //       child: const Padding(
                        //         padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             Icon(Ionicons.logo_facebook,
                        //                 color: Colors.blue, size: 26),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    /// Bottom Text
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text("By continuing you agree to Krunch’s ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        const Text("Terms of Service",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("and ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        const Text("Privacy Policy",
                            style:
                                TextStyle(decoration: TextDecoration.underline))
                      ],
                    ),
                    const SizedBox(height: 122)
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
