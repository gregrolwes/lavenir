import 'package:lavenir/models/session.dart';

class Day {
  final String day;
  final List<Session> sessions;

  Day({this.day, this.sessions});
}

class AvailabilityDay {
  final String day;
  final List<AvailabilitySession> availabilitySessions;

  AvailabilityDay({this.day, this.availabilitySessions});
}
