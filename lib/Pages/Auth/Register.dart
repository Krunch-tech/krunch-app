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

late SignUpRequestModel _user;
Future<SignUpRequestModel> createUser(
    String email, String name, String password) async {
  final String url = "https://api.krunchtheapp.com/signup";

  final response = await http.post(Uri.parse(url),
      body: {"name": name, "email": email, "password": password});
  print(response.body);
  if (response.statusCode == 200) {
    final String responseString = response.body;

    return signUpRequestModelFromJson(responseString);
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
  bool showSpinner = false;
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
              GestureDetector(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios_rounded),
                    Text("Sign in")
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Register"),
                    SizedBox(height: 30),
                    Text("name"),
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
                    Text("email"),
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
                    Text("Password"),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password'),
                    ),
                    Text("Confirm Password"),
                    TextField(
                      obscureText: true,
                      textAlign: TextAlign.start,
                      onChanged: (value) {
                        checkpassword = value;
                      },
                      decoration: kTextFieldDecoration.copyWith(
                          fillColor: Colors.white,
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
                              final SignUpRequestModel user =
                                  await createUser(name, email, password);
                              setState(() {
                                _user = user;
                                allowTap = false;
                                showSpinner = true;
                              });
                              Navigator.pop(context);
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
                            onTap: () async {},
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
