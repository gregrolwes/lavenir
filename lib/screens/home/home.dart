import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lavenir/shared/constants.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: backgroundColor,
     appBar: AppBar(
       title: Text('Lavenir'),
       backgroundColor: headerColor,
       elevation: 0.0,
       actions: <Widget>[
         FlatButton.icon(
            icon: Icon(Icons.person, color: headerIconColor,), 
            label: Text('Logout', style: headerText),
            onPressed: () async {
              await _auth.signOut();
            },
         ),
       ],
     )
    );
  }
}