import '../main.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import '../helpers/logins.dart';


class LoginView extends StatelessWidget {
  Widget build(BuildContext context) {
    RaisedButton _fbButton = new RaisedButton(
        child: new Row(
            children:<Widget> [
              new Icon(Icons.face)
              ,new Text("Facebook Login")]
        ),
        color: Colors.blueAccent,
        onPressed: (){
          log('fb pressed');
        }
    );

    RaisedButton _gmailButton = new RaisedButton(
        child: new Row(
            children:<Widget> [
              new Icon(Icons.android)
              ,new Text("Google Login")]
        ),
        color: Colors.redAccent,
        onPressed: (){
          loginGmail().then((val){if(val)Navigator.pushReplacementNamed(context, '/');});
        }
    );

    Container container =  new Container(
        padding: const EdgeInsets.all(16.0),
        child: new Column(
            children: [ new Padding(padding: new EdgeInsets.all(52.0)), new Text("Hello youre in log in now...", style:headerStyle), new Padding(padding: new EdgeInsets.all(22.0)), _fbButton,  new Padding(padding: new EdgeInsets.all(12.0)), _gmailButton ]
        )
    );
    AppBar appBar = new AppBar(title: new Text("Tip Calculator"));
    return new Scaffold(appBar: appBar, body: container);
  }
}