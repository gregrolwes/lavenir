import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lavenir/shared/constants.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: lightGreen,
     appBar: AppBar(
       title: Text('Lavenir'),
       backgroundColor: green,
       elevation: 0.0,
       actions: <Widget>[
         FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,), 
            label: Text('Logout', style: TextStyle(color: Colors.white,)),
            onPressed: () async {
              await _auth.signOut();
            },
         ),
       ],
     )
    );
  }
}