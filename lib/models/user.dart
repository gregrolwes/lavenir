import 'package:lavenir/models/day.dart';

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final List<AvailabilityDay> availabilityData;

  UserData({this.uid, this.availabilityData});
}
