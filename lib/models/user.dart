import 'package:lavenir/models/day.dart';
import 'package:lavenir/models/session.dart';

class User {
  final String uid;

  User({this.uid});
}

class UserData {
  final String uid;
  final Map availabilityData;

  UserData({this.uid, this.availabilityData});
}
