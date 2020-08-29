import 'package:lavenir/models/user.dart';
import 'package:lavenir/screens/home/availability.dart';
import 'package:lavenir/screens/home/announcement_list.dart';
import 'package:lavenir/screens/home/schedule.dart';
import 'package:lavenir/screens/wrapper.dart';
import 'package:lavenir/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(initialRoute: '/screens/wrapper', routes: {
        '/screens/wrapper': (context) => Wrapper(),
        '/home/availability': (context) => Availability(),
        '/home/announcements': (context) => AnnouncementList(),
        '/home/schedule': (context) => Schedule(),
      }),
    );
  }
}
