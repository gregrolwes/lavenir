import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavenir/models/announcement.dart';
import 'package:lavenir/shared/constants.dart';

class AnnouncementCard extends StatefulWidget {
  final Announcement announcement;
  const AnnouncementCard(this.announcement);

  @override
  _AnnouncementCardState createState() => _AnnouncementCardState();
}

class _AnnouncementCardState extends State<AnnouncementCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cardMargin,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text(widget.announcement.title, style: new TextStyle(fontSize: 25.0),),
                  Spacer(),
                  Icon(Icons.announcement, color: Colors.redAccent)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(widget.announcement.content)
                        ,),
                  ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                Text(DateFormat('MM/dd/yyyy').format(widget.announcement.postDate).toString()),
                Spacer(),
              ],),
            )
          ]
        ),
      ),
      decoration: boxShadow
    );
  }
}