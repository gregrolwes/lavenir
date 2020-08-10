import 'package:lavenir/models/user.dart';
import 'package:lavenir/screens/wrapper.dart';
import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  @override
  List nums = [1, 2, 3, 4, 5];

  int index = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _DayButton("Monday"),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Tuesday"),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Wednesday"),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Thursday"),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Friday"),
              ],
            ),
          ),
          // Text("j")
        ],
      ),
    );
  }
}

class _DayButton extends StatefulWidget {
  String day = "";
  _DayButton(String day) {
    this.day = day;
  }
  @override
  __DayButtonState createState() => __DayButtonState();
}

class __DayButtonState extends State<_DayButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 200,
      child: FlatButton(
          color: Colors.orange, onPressed: () {}, child: Text(widget.day)),
    );
  }
}
