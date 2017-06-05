import '../main.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

Future<bool> silentLogin() async {
  if (user == null)
    user = await googleSignIn.signInSilently();
  return user != null;
}

Future<bool> logout() async {
  if(user != null){
    await googleSignIn.disconnect();
    user = null;
    return true;
  }
  return false;
}

Future<bool> loginGmail() async {
  if (user == null) {
    await googleSignIn.signIn();
    analytics.logLogin();
  }
  if (auth.currentUser == null) {  //new
    GoogleSignInAuthentication credentials =                       //new
    await googleSignIn.currentUser.authentication;                 //new
    await auth.signInWithGoogle(                                   //new
      idToken: credentials.idToken,                                //new
      accessToken: credentials.accessToken,                        //new
    );                                                             //new
  }
  return true;
}