import 'package:flutter/cupertino.dart';
import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:lavenir/shared/constants.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double height = MediaQuery. of(context). size. height;

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
     ),
      body: Center(
          child:
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
          children:
            <Widget>[
              Text("Upcoming Shifts",
              style: TextStyle(fontSize: height/20, fontWeight: FontWeight.bold)),
              SizedBox(height:height/2.5),

              _ButtonDesign("Shift Requests",width),
              SizedBox(height:height/25),
              _ButtonDesign("Time Off Requests",width),
              SizedBox(height:height/25),

              _ButtonDesign("Work Chat Messages",width),
              SizedBox(height:height/25),

              _ButtonDesign("Set My Availability",width),
              SizedBox(height:height/25),

            ]
        ),
      ),

    );
  }
}

class _ButtonDesign extends StatelessWidget {
  String input = "";
  double screenWidth = 0;
  _ButtonDesign(String inp, double width) {
    this.input = inp;
    this.screenWidth = width;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 1.5,
        child:
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: Colors.orangeAccent[100],
              child:Text(this.input, ),
            onPressed: (){

    },));
  }
}
