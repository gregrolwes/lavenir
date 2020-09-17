import 'package:flutter/material.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/screens/home/schedule_day_card.dart';
import 'package:provider/provider.dart';

class ScheduleList extends StatefulWidget {
  @override
  _ScheduleListState createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {


  // Map dayList = {
  //   "Monday": [
  //     Session(
  //         "8 - 9 PM", ["James Smith", "Michael Smith", "Robert Smith"], 2),
  //     Session("7 - 8 PM", ["Maria Garcia", "David Smith"], 3)
  //   ],
  //   "Tuesday": [
  //     Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
  //     Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5)
  //   ],
  //   "Wednesday": [
  //     Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
  //     Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5),
  //     Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5),
  //     Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3)
  //   ],
  //   "Thursday": [
  //     Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
  //     Session("7 - 9 PM", ["Maria Rodriguez", "Mary Smith"], 5)
  //   ],
  //   "Friday": [
  //     Session("8 - 9 PM", ["Maria Martinez", "James Johnson"], 3),
  //   ],
  // };
  @override
  Widget build(BuildContext context) {
    final List<ScheduleDayCard> dayCardList = Provider.of<List<Day>>(context)?.map((day) {
      return ScheduleDayCard(day);
    })?.toList() ?? [];

    return ListView(
      children: dayCardList,
    );
  }
}
