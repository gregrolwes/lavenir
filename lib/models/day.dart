import 'package:lavenir/models/session.dart';

class Day {
  String day;
  List<Session> sessions;

  Day(String day, List<Session> sessions) {
    this.day = day;
    this.sessions = sessions;
  }
}