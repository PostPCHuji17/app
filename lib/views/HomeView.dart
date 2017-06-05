import '../main.dart';
import 'LoginView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../helpers/logins.dart';
import 'dart:async';

class HomeView extends StatelessWidget{

  Widget build(BuildContext context) {
    silentLogin().then((connected){
      if(connected)
        Navigator.of(context).pushReplacementNamed('/main');
      else
        Navigator.of(context).pushReplacementNamed('/login');
    });
    AppBar appBar = new AppBar();
    return new Scaffold(appBar: appBar, body: new Container(
        child: new Center(
            child: new Text("Loading", style: headerStyle)
        )
    ));
    
  }
}