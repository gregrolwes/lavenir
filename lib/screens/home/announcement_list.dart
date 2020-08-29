import 'package:flutter/material.dart';
import 'package:lavenir/screens/home/announcement_card.dart';
import 'package:lavenir/models/announcement.dart';
import 'package:provider/provider.dart';

class AnnouncementList extends StatefulWidget {
  @override
  _AnnouncementListState createState() => _AnnouncementListState();
}

class _AnnouncementListState extends State<AnnouncementList> {
  @override
  Widget build(BuildContext context) {
    final List<AnnouncementCard> announcementCardList = Provider.of<List<Announcement>>(context)
      .map((announcement) {
        return AnnouncementCard(announcement);
      }).toList();

    return Container(
      child: ListView(
        children: announcementCardList,
      ), 
    );
  }
}
