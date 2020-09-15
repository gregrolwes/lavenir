import 'package:flutter/material.dart';

import 'package:lavenir/shared/constants.dart';

class ScheduleDayList extends StatefulWidget {
  @override
  _ScheduleDayListState createState() => _ScheduleDayListState();
}

class _ScheduleDayListState extends State<ScheduleDayList> {
  double setHeight(double height) {
    return MediaQuery.of(context).size.height / height;
  }

  Widget _tile(String time, List<String> names, int openSlots) {
    String _names = "";
    for (int i = 0; i < names.length; i++) {
      _names = _names + names[i] + "\n";
    }
    _names = _names.substring(0, _names.length - 1);
    return Container(
      margin: cardMargin,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(time,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: setHeight(40))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("Slots Available : $openSlots",
                      style: TextStyle(fontSize: setHeight(40), fontWeight: FontWeight.w600)
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                    // color: Colors.blue,
                    child: Text(_names,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: setHeight(40)))))
          ],
        ),
      ),
      decoration: boxShadow,
    );
  }

  Widget day(String day, List<Session> sessions) {
    List<Widget> vals = [];
    vals.add(Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              day,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 20
              ),
            ),
          ),
        ),
      );
    for (int i = 0; i < sessions.length; i++) {
      vals.add(
          _tile(sessions[i].time, sessions[i].students, sessions[i].openSlots));
    }
    return Container(
        child: Column(
      children: vals,
    ));
  }

  Map dayList = {
    "Monday": [
      Session(
          "8 - 9 PM", ["James Smith", "Michael Smith", "Robert Smith"], 2),
      Session("7 - 8 PM", ["Maria Garcia", "David Smith"], 3)
    ],
    "Tuesday": [
      Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5)
    ],
    "Wednesday": [
      Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5),
      Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5),
      Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3)
    ],
    "Thursday": [
      Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5)
    ],
    "Friday": [
      Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
    ],
  };
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dayList.length,
        itemBuilder: (BuildContext context, int index) {
          return day(dayList.keys.elementAt(index).toString(),
              dayList.values.elementAt(index) as List);
        });
  }
}

class Session {
  String time;
  List<String> students;
  int openSlots;

  Session(String time, List<String> students, int openSlots) {
    this.time = time;
    this.students = students;
    this.openSlots = openSlots;
  }
}
