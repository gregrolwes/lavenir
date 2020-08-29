import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavenir/models/announcement.dart';

class Announcements extends StatelessWidget {

  final List<Announcement> announcementList = [
    Announcement(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: announcementList.length,
        itemBuilder: (BuildContext context, int index) => buildAnnouncementCard(context, index)
      ), 
    );
  }

  Widget buildAnnouncementCard(BuildContext context, int index) {
    final announcement = announcementList[index];
    return new Container(
      margin: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Text(announcement.title, style: new TextStyle(fontSize: 25.0),),
                  Spacer(),
                  Icon(Icons.announcement, color: Colors.redAccent)
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: Row(
                  children: <Widget>[
                    Expanded(
                      child: new Text(announcement.content)
                        ,),
                  ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                Text(DateFormat('MM/dd/yyyy').format(announcement.postDate).toString()),
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

