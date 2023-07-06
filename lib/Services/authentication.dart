import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();

  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
  //return a stream to track if user is login
  static Stream<GoogleSignInAccount?> get currentUser =>
      _googleSignIn.onCurrentUserChanged;
  //check if user authenticated is valid or not
  Future<bool> get isSignedIn => _googleSignIn.isSignedIn();
  static Future<GoogleSignInAccount?> get signInAccount =>
      _googleSignIn.signInSilently();
  static Future logout() => _googleSignIn.disconnect();
}
//create database using sqflite for storing user access token