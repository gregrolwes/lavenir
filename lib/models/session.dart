class Session {
  String time;
  List<String> students;
  int openSlots;

  Session(String time, List<String> students, int openSlots) {
    this.time = time;
    this.students = students;
    this.openSlots = openSlots;
  }
}