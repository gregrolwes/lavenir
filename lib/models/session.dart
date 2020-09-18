class Session {
  final String time;
  final List<dynamic> tutors;
  final int openSlots;

  Session({this.time, this.tutors, this.openSlots});
}

class AvailabilitySession {
  final String time;
  final bool availability;

  AvailabilitySession({this.time, this.availability});
}
