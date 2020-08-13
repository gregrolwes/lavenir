import 'package:flutter/material.dart';

class Availability extends StatefulWidget {
  @override
  _AvailabilityState createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  Map m = {
    'Monday': [
      Sessions("4 - 5 pm", true),
      Sessions("5 - 6 pm", false),
      Sessions("6 - 7 pm", true)
    ],
    'Tuesday': [Sessions("3 - 4 pm", true), Sessions("6 - 7 pm", false)],
    'Wednesday': [Sessions("4 - 5 pm", true), Sessions("6 - 7 pm", false)],
    'Thursday': [
      Sessions("4 -5 pm", true),
      Sessions("6 - 7 pm", false),
      Sessions("7 - 8 pm", false),
      Sessions("8 - 9 pm", false)
    ],
    'Friday': [],
    'Saturday': [],
    'Sunday': []
  };

  Map indToDay = {
    0: "Monday",
    1: "Tuesday",
    2: "Wednesday",
    3: "Thursday",
    4: "Friday",
    5: 'Saturday',
    6: 'Sunday'
  };

  int _index = 0;
  String s = "";

  Widget Card(String slot, bool availbl, int index) {
    slot = (availbl) ? slot + "\n\nAvailable" : slot + "\n\nUnavailable";
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Container(
          width: 300,
          height: 150,
          child: FlatButton(
            child: Center(child: Text(slot)),
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
      return SizedBox(
        height: 10,
        width: 125,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 5, 0),
          child: FlatButton(
              color: Colors.orange,
              onPressed: () {
                setState(() {
                  _index = ind;
                });
              },
              child: Text(day)),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Text(
                indToDay[_index],
                style: (TextStyle(fontSize: 40)),
              )),
          Expanded(
              flex: 8,
              child: ListView.builder(
                  itemCount: m[indToDay[_index]].length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Card(m[indToDay[_index]][index].slot,
                        m[indToDay[_index]][index].availbl, index);
                  })),
          Expanded(
              flex: 3,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: m.keys.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _DayButton(indToDay[index], index);
                  })),
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
