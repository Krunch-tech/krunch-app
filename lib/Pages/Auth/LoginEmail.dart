import 'package:flutter/material.dart';
import 'package:krunch_app/Pages/Auth/Register.dart';
import 'package:krunch_app/Pages/home.dart';
import 'package:krunch_app/constants.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({Key? key}) : super(key: key);

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  bool isRegistered = false;
  bool nextPage = false;
  var email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Color(0xffF2F4F6)),
          nextPage
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    TextButton(
                      child: Row(
                        children: [
                          Icon(Icons.keyboard_arrow_left,
                              color: Color(0xff6271FF), size: 28),
                          Text("Email",
                              style: TextStyle(
                                  color: Color(0xff6271FF), fontSize: 16))
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          nextPage = false;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 13),
                          Text(
                            "Log in with password",
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                letterSpacing: -1.5),
                          ),
                          SizedBox(height: 13),
                          Row(
                            children: [
                              Text("for ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14)),
                              Text(email,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline)),
                            ],
                          ),
                          SizedBox(height: 36),
                          TextField(
                            autofocus: true,
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.start,
                            onChanged: (value) {},
                            decoration: kTextFieldDecoration.copyWith(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: 'Password'),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),

                    /// Login Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xff6271FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text("Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        },
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: Text("Forgot Password",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                                color: Colors.grey.shade400)),
                        onPressed: () {},
                      ),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    TextButton(
                      child: Row(
                        children: const [
                          Icon(Icons.keyboard_arrow_left,
                              color: Color(0xff6271FF), size: 28),
                          Text("Sign in",
                              style: TextStyle(
                                  color: Color(0xff6271FF), fontSize: 16))
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(height: 13),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("What's your email?",
                          style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              letterSpacing: -1.5)),
                    ),
                    SizedBox(height: 64),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.start,
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: 'abc@xyz.com'),
                      ),
                    ),
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: GestureDetector(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Color(0xff6271FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: const Center(
                              child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text("Continue",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)),
                          )),
                        ),
                        onTap: () {
                          setState(() {
                            nextPage = true;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: TextButton(
                        child: Text("Don't have an account?"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
