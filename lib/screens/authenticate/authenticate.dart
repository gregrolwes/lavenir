import 'package:flutter/material.dart';
import 'package:lavenir/screens/authenticate/register.dart';
import 'package:lavenir/screens/authenticate/sign_in.dart';
import 'package:lavenir/shared/constants.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  String get _headerLabel {
    return showSignIn ? 'Register' : 'Sign In';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreen,
      appBar: AppBar(
        backgroundColor: green,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            onPressed: () { setState(() => showSignIn = !showSignIn); }, 
            icon: Icon(Icons.person, color: Colors.white,), 
            label: Text(_headerLabel, style: TextStyle(color: Colors.white,)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: showSignIn ? SignIn() : Register(),
        ),
      ),
    );
  }
}