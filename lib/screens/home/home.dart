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
                mainAxisAlignment: MainAxisAlignment.start,
          children:
            <Widget>[
              SizedBox(height:height/20),
              Text("Upcoming Shifts",
              style: TextStyle(fontSize: height/20, fontWeight: FontWeight.bold)),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: height/3,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: width,
                  color: Colors.red,
                ),
                Container(
                  width: width,
                  color: Colors.blue,
                )]),
        ),
              SizedBox(height:height/7),
              _ButtonDesign("Request Shift",width),
              SizedBox(height:height/15),

              _ButtonDesign("View Available Shifts",width),
//              SizedBox(height:height/8),

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
