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
  List<String> nums = <String>["1", "2", "3", "4", "5"];

  int index = 0;
  String s = "";
  @override
  Widget build(BuildContext context) {
    Widget _DayButton(String day, int ind) {
      return Container(
        width: 125,
        height: 200,
        child: FlatButton(
            color: Colors.orange,
            onPressed: () {
              setState(() {
                index = ind;
                s = nums.elementAt(index);
              });
            },
            child: Text(day)),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: 200.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _DayButton("Monday", 0),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Tuesday", 1),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Wednesday", 2),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Thursday", 3),
                SizedBox(
                  width: 20,
                ),
                _DayButton("Friday", 4),
              ],
            ),
          ),
          Container(child: Text("$s")),
        ],
      ),
    );
  }
}
