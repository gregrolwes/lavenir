import 'package:flutter/material.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/screens/home/schedule_day_list.dart';
import 'package:lavenir/services/database.dart';
import 'package:provider/provider.dart';

class Schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Day>>.value(
      value: DatabaseService().schedule,
      child: ScheduleList(),
    );
  }
}
