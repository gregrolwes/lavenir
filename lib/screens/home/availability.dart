import 'package:flutter/material.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  Map m = {
    'Monday': [
      Sessions("4 -5", true),
      Sessions("4 -5", true),
      Sessions("4 -5", true)
    ],
    'Tuesday': [Sessions("4 -5", true)],
    'Wednesday': [Sessions("4 -5", true)],
    'Thursday': [Sessions("4 -5", true)],
    'Friday': [Sessions("4 -5", true)]
  };

  Map indToDay = {
    0: "Monday",
    1: "Tuesday",
    2: "Wednesday",
    3: "Thursday",
    4: "Friday"
  };

  int _index = 0;
  String s = "";

  Widget Card(String slot, bool availbl, int index) {
    slot = (availbl) ? slot + "\nAvailable" : slot + "\nUnavailable";
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 300,
          height: 150,
          child: FlatButton(
            child: Text(slot),
            color: (availbl) ? Colors.green : Colors.red,
            onPressed: () {
              setState(() {
                availbl = (!availbl);
                m[indToDay[_index]][index].availbl = availbl;
              });
            },
          )),
    );
  }

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
                _index = ind;
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
          Expanded(
              child: ListView.builder(
                  itemCount: m[indToDay[_index]].length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Card(m[indToDay[_index]][index].slot,
                        m[indToDay[_index]][index].availbl, index);
                  }))
          // child: Text(m["Monday"][0].slot)),
        ],
      ),
    );
  }
}

class Sessions {
  String slot = "";
  bool availbl = false;
  Sessions(String slot, bool availbl) {
    this.slot = slot;
    this.availbl = availbl;
  }
}
