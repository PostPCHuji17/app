// Copyright 2017, the Flutter project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'dart:math';
import 'package:views_app/views/LoginView.dart';
import 'package:views_app/views/HomeView.dart';
import 'package:views_app/views/MainView.dart';

final ThemeData kIOSTheme = new ThemeData(
  primarySwatch: Colors.orange,
  primaryColor: Colors.grey[100],
  primaryColorBrightness: Brightness.light,
);

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.purple,
  accentColor: Colors.orangeAccent[400],
);

final TextStyle headerStyle = new TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.italic
);

final googleSignIn = new GoogleSignIn();
final analytics = new FirebaseAnalytics();
final auth = FirebaseAuth.instance;
final reference = FirebaseDatabase.instance.reference().child('messages');

const String _name = "Your Name";
GoogleSignInAccount user = googleSignIn.currentUser;

void main() {
  runApp(new MaterialApp(
    home: new HomeView(), // becomes the route named '/'
    routes: <String, WidgetBuilder> {
      '/login': (BuildContext context) => new LoginView(),
      '/main': (BuildContext context) => new MainView(),
    },
  ));
}

Future<Null> ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if (user == null)
    user = await googleSignIn.signInSilently();
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
  }                                                               //new
}

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "Friendlychat",
      home: new LoginView(),
    );
  }
}

