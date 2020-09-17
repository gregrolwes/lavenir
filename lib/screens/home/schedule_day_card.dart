import 'package:flutter/material.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/models/session.dart';
import 'package:lavenir/shared/constants.dart';

class ScheduleDayCard extends StatefulWidget {
  final Day day;
  const ScheduleDayCard(this.day);

  @override
  _ScheduleDayCardState createState() => _ScheduleDayCardState();
}

class _ScheduleDayCardState extends State<ScheduleDayCard> {
  double setHeight(double height) {
    return MediaQuery.of(context).size.height / height;
  }

  Widget _tile(String time, List<dynamic> names, int openSlots) {
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
  
  @override
  Widget build(BuildContext context) {
    List<Widget> vals = [];
    vals.add(Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            widget.day.day,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 20
            ),
          ),
        ),
      ),
    );

    List<Session> sessions = widget.day.sessions;
    for(var i=0; i < sessions.length; i++){
      Session session = sessions[i];
      vals.add(
        _tile(session.time, session.tutors, session.openSlots)
      );
    }

    return Container(
        child: Column(
      children: vals,
    ));
  }
}