import 'package:lavenir/models/user.dart';
import 'package:lavenir/screens/shifts/add-availability.dart';
import 'package:lavenir/screens/shifts/request-shift.dart';
import 'package:lavenir/screens/shifts/view-shifts.dart';
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
        '/shifts/add-availability': (context) => AddAvailability(),
        '/shifts/request-shifts': (context) => RequestShift(),
        '/shifts/view-shifts': (context) => ViewShift(),
      }),
    );
  }
}
