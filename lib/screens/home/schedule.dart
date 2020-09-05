import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
            boxOutline(),
            Text("Monday 4-5pm"),
            SizedBox(height: 7.5),
            Text("Wednesday 5-6pm")
          ],),
        ),
      )
    );
  }
}

Widget boxOutline() {
  return Container(
    margin: const EdgeInsets.all(15.0),
    padding: const EdgeInsets.all(7.5),
    decoration: myBoxDecoration(),
    child: Text(
      "Your Name",
      style: TextStyle(fontSize: 25.0),
      ),
  );
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width: 3,
    ),
  );
}