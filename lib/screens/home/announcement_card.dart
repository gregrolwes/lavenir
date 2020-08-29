import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavenir/models/announcement.dart';

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
      margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
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
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
    );
  }
}