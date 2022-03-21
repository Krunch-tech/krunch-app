import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:krunch_app/constants.dart';
import 'package:http/http.dart' as http;
import '../../Models/Auth/SignUpModel.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

late SignUpResponseModel _user;
Future<SignUpResponseModel> createUser(
    String email, String name, String password) async {
  final String url = "https://api.krunchtheapp.com/signup";

  final response = await http.post(Uri.parse(url),
      body: {"name": name, "email": email, "password": password});
  print(response.body);
  if (response.statusCode == 200) {
    final String responseString = response.body;
    return signUpResponseModelFromJson(responseString);
  } else {
    return jsonDecode(response.body);
  }
}

class _RegisterState extends State<Register> {
  var name;
  var password;
  var checkpassword;
  var email;
  bool allowTap = true;
  Color colour1 = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color(0xffF2F4F6),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              TextButton(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Color(0xff6271FF),
                      size: 18,
                    ),
                    Text("Sign in",
                        style:
                            TextStyle(color: Color(0xff6271FF), fontSize: 14))
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 34,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1.5)),
                    SizedBox(height: 30),
                    Text("Name"),
                    TextField(
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        name = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Name'),
                    ),
                    SizedBox(height: 8),
                    Text("Email"),
                    TextField(
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
                    SizedBox(height: 8),
                    Text("Password"),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: colour1,
                          filled: true,
                          hintText: 'Password'),
                    ),
                    SizedBox(height: 8),
                    Text("Confirm Password"),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        checkpassword = value;
                        if (value != password) {
                          setState(() {
                            if (checkpassword.length == 0) {
                              colour1 = Colors.white;
                            } else {
                              colour1 = Colors.red.withOpacity(0.2);
                            }
                          });
                        } else {
                          setState(() {
                            colour1 = Colors.green.withOpacity(0.2);
                          });
                        }
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: colour1,
                          filled: true,
                          hintText: 'Confirm Password'),
                    ),
                    SizedBox(height: 16),
                    allowTap
                        ? GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color(0xff6271FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text("Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              )),
                            ),
                            onTap: () async {
                              if (checkpassword == password) {
                                final SignUpResponseModel user =
                                    await createUser(email, name, password);
                                setState(() {
                                  _user = user;
                                  // allowTap = false;
                                });
                                if (_user.success == true) {
                                  Navigator.pop(context);
                                }
                              }
                            },
                          )
                        : GestureDetector(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  color: Color(0xff6271FF),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                child: Text("Register",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                              )),
                            ),
                            onTap: () {},
                          ),
                    SizedBox(height: 60),
                    // showSpinner ? CircularProgressIndicator() : Container(),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
