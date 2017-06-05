import '../main.dart';
import '../helpers/logins.dart';
import 'package:flutter/material.dart';
import 'dart:async';



class MainView extends StatelessWidget{

  Widget build(BuildContext context) {
    RaisedButton calculateButton = new RaisedButton(
        child: new Text("Disconnect"),
        onPressed: (){logout().then((succ)=>Navigator.of(context).pushReplacementNamed('/'));}
    );
    Text txt = new Text("Hello "+user.displayName);
    Container container = new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [txt, calculateButton]
        )
    );
    AppBar appBar = new AppBar(title: new Text("MoneySaver"));
    return new Scaffold(appBar: appBar, body: container);
  }
}