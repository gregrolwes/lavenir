import 'package:flutter/material.dart';
import 'package:lavenir/models/announcement.dart';
import 'package:lavenir/screens/home/announcement_list.dart';
import 'package:lavenir/services/database.dart';
import 'package:provider/provider.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Announcement>>.value(
      value: DatabaseService().announcements,
      child: AnnouncementList(),
    );
  }
}