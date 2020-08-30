import 'package:flutter/material.dart';

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
    _names = _names.substring(0, _names.length - 2);
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
                        style: TextStyle(fontSize: setHeight(25))),
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

  Widget Day(String day, Map names, int slots) {
    List<Widget> vals = [];
    vals.add(Text("$day", style: TextStyle(fontSize: setHeight(25))));
    for (int i = 0; i < names.values.length; i++) {
      vals.add(_tile(names.keys.elementAt(i), names.values.elementAt(i), 2));
    }
    return Container(
        child: Column(
      children: vals,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Day(
            "Monday",
            {
              "5 - 6": ["James Smith", "Michael Smith", "Robert Smith"],
              "7 - 8": ["Maria Garcia", "David Smith"]
            },
            2),
        Day(
            "Tuesday",
            {
              "8 - 9": ["Maria Martinez", "James Johnson"],
              "7 - 9": ["Maria Rodriguez", "Mary Smith"]
            },
            2)
      ],
    );
  }
}
