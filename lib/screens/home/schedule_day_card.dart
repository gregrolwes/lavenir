import 'package:flutter/material.dart';
import 'package:lavenir/models/session.dart';

class DayCard extends StatefulWidget {
  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  double setHeight(double height) {
    return MediaQuery.of(context).size.height / height;
  }

  Widget _tile(String time, List<String> names, int openSlots) {
    String _names = "";
    for (int i = 0; i < names.length; i++) {
      _names = _names + names[i] + "\n";
    }
    _names = _names.substring(0, _names.length - 1);
    return Padding(
      padding: EdgeInsets.all(setHeight(300)),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(time,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: setHeight(27))),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Text("Slots Available : $openSlots",
                    style: TextStyle(fontSize: setHeight(40))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget day(String day, List<Session> sessions) {
    List<Widget> vals = [];
    vals.add(Text("$day", style: TextStyle(fontSize: setHeight(25))));
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
          "8 - 9\np.m.", ["James Smith", "Michael Smith", "Robert Smith"], 2),
      Session("7 - 8\np.m.", ["Maria Garcia", "David Smith"], 3)
    ],
    "Tuesday": [
      Session("8 - 9\np.m.", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9\np.m.", ["Maria Rodriguez", "Mary Smith"], 5)
    ],
    "Wednesday": [
      Session("8 - 9\np.m.", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9\np.m.", ["Maria Rodriguez", "Mary Smith"], 5),
      Session("7 - 9\np.m.", ["Maria Rodriguez", "Mary Smith"], 5),
      Session("8 - 9\np.m.", ["Maria Martinez", "James Johnson"], 3)
    ],
    "Thursday": [
      Session("8 - 9\np.m.", ["Maria Martinez", "James Johnson"], 3),
      Session("7 - 9\np.m.", ["Maria Rodriguez", "Mary Smith"], 5)
    ],
    "Friday": [
      Session("8 - 9\np.m.", ["Maria Martinez", "James Johnson"], 3),
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
