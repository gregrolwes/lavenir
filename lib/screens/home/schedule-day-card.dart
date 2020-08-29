import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DayCard extends StatefulWidget {
  @override
  _DayCardState createState() => _DayCardState();
}

class _DayCardState extends State<DayCard> {
  double setHeight(double height) {
    return MediaQuery.of(context).size.height / height;
  }

  Widget _Tile(String time, List<String> names, int openSlots) {
    return Container(
        color: Colors.yellow,
        child: Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.orangeAccent,
                child: Center(
                    child: Text(
                  time,
                  style: TextStyle(
                    fontSize: setHeight(25),
                    color: Colors.black87,
                  ),
                )),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(
                      height: setHeight(37) * names.length + setHeight(50),
                      color: Colors.blue,
                      child: Center(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: names.length,
                            itemBuilder: (BuildContext ctxt, int index) {
                              return Center(
                                  child: Text(names[index],
                                      style:
                                          TextStyle(fontSize: setHeight(37))));
                            }),
                      )),
                  Text("Open Slots : $openSlots",
                      style: TextStyle(fontSize: setHeight(37)))
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Text("Monday", style: TextStyle(fontSize: setHeight(25))),
              _Tile("8 - 9", ["abc", "def"], 3),
              _Tile("8 - 9", ["abc", "def", "ghi", "jkl"], 3)
            ],
          ),
        )
      ],
    ));
  }
}
