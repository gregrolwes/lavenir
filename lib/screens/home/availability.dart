import 'package:flutter/material.dart';

import 'package:lavenir/shared/constants.dart';

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
      Sessions("8 - 9 pm", false),
      Sessions("9 - 10 pm", false)
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

  List<String> days = <String>["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  int _index = 0;

  Widget card(String slot, bool availble, int index) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, MediaQuery.of(context).size.height / 190),
      child: Container(
        margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
        height: MediaQuery.of(context).size.height / 8,
        child: FlatButton(
          child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                        text: slot,
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height / 40)),
                    TextSpan(
                        text: (availble) ? "\n\nAvailable" : "\n\nUnavailable",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: (availble) ? Colors.greenAccent[700] : Colors.red[500],
                            fontSize: MediaQuery.of(context).size.height / 38)
                        ),
                  ])),
          onPressed: () {
            setState(() {
              availble = (!availble);
              m[indToDay[_index]][index].availble = availble;
            });
          },
        ),
        decoration: boxShadow
      ),
    );
  }

  Widget _dayButton(String day, int ind) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: Padding(
        // padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
        padding: (ind == _index)
            ? EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 180,
                MediaQuery.of(context).size.width / 80, 0)
            : EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height / 80,
                MediaQuery.of(context).size.width / 80, 0),
        child: Opacity(
          opacity: (ind == _index) ? 1.0 : 0.7,
          child: FlatButton(
            color: mainColor,
            onPressed: () {
              setState(() {
                _index = ind;
              });
            },
            child: Text(
              day,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 37,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    indToDay[_index],
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 20),
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 16,
            child: ListView.builder(
              itemCount: m[indToDay[_index]].length,
              itemBuilder: (BuildContext ctxt, int index) {
                return card(m[indToDay[_index]][index].slot,
                    m[indToDay[_index]][index].availble, index);
              }
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return _dayButton(days[index], index);
                }
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sessions {
  String slot = "";
  bool availble = false;
  Sessions(String slot, bool availble) {
    this.slot = slot;
    this.availble = availble;
  }
}