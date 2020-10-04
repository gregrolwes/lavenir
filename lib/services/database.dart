import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lavenir/models/announcement.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/models/session.dart';
import 'package:lavenir/models/availability_model.dart';
import 'package:lavenir/models/user.dart';
import 'package:lavenir/screens/home/availability.dart';
import 'package:lavenir/screens/home/availability_card.dart';
import 'package:lavenir/services/auth.dart';
import 'package:provider/provider.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference announcementsCollection =
      Firestore.instance.collection('announcements');
  final CollectionReference scheduleCollection =
      Firestore.instance.collection('schedule');
  final CollectionReference availabilityData =
      Firestore.instance.collection('availability');
  final CollectionReference userData =
      Firestore.instance.collection('user_data');

  /// Gets the slots from firestore and sets all slots to false when a new user registers
  Future instantiateUserData() async {
    String dayData;
    List sessionData = new List();
    Map tempMap = new Map();
    await availabilityData.snapshots().forEach((element) async {
      for (int i = 0; i < element.documents.length; i++) {
        List tempList = new List();
        dayData = "";
        sessionData.clear();
        String slot;

        dayData = await element.documents.elementAt(i).data['day'];
        tempList = await element.documents.elementAt(i).data['sessions'];

        for (int j = 0; j < tempList.length; j++) {
          slot = tempList[j];
          sessionData.add({slot: false});
        }
        tempMap[dayData] = sessionData;
        await userData.document(uid).setData({
          dayData: tempMap[dayData] ?? [],
        }, merge: true);
      }
    });
  }

  Future updateUserData(Map data) async {
    // Data comes in form {Day:[Sessions(), Sessions()], Day:[Sessions()]}
    // need to convert to {Day:[{time:bool}, {time:bool}], Day[{},{}]}
    for (var key in data.keys) {
      List tempList = new List();
      for (int i = 0; i < data[key].length; i++) {
        String time = data[key].elementAt(i).slot;
        bool availability = data[key].elementAt(i).availble;
        tempList.add({time: availability});
      }
      await userData.document(uid).setData({
        key: tempList ?? [],
      }, merge: true);
    }
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map tempMap = new Map();
    for (var key in snapshot.data.keys) {
      List tempList = new List();
      for (int i = 0; i < snapshot[key].length; i++) {
        String time = snapshot[key].elementAt(i).keys.elementAt(0);
        bool availability = snapshot[key].elementAt(i).values.elementAt(0);
        tempList.add(Sessions(time, availability));
      }
      tempMap[key] = tempList;
    }
    return UserData(uid: uid, availabilityData: tempMap);
  }

  // get user doc stream
  Stream<UserData> get user_data {
    return userData.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  List<Announcement> _announcementListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Announcement(
        title: doc.data['title'] ?? 'Announcement',
        postDate: DateTime.parse(doc.data['postDate'].toDate().toString()) ??
            DateTime.now(),
        content: doc.data['content'] ?? '',
      );
    }).toList();
  }

  Stream<List<Announcement>> get announcements {
    return announcementsCollection
        .snapshots()
        .map(_announcementListFromSnapshot);
  }

  List<Session> _sessionListFromJSON(List rawSessions) {
    return rawSessions.map((session) {
      return Session(
        time: session['time'] ?? '',
        tutors: session['tutors'].map((tutor) => tutor).toList() ?? [],
        openSlots: session['openSlots'] ?? 0,
      );
    }).toList();
  }

  List<Day> _dayListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Day(
        day: doc.data['day'] ?? '',
        sessions: _sessionListFromJSON(doc.data['sessions']) ?? List<Session>(),
      );
    }).toList();
  }

  Stream<List<Day>> get schedule {
    return scheduleCollection.snapshots().map(_dayListFromSnapshot);
  }

  List<AvailabilityData> _availabilitySessionListFromJSON(
      QuerySnapshot snapshot) {
    List<AvailabilityData> temp = new List();
    for (var doc in snapshot.documents) {
      // print(doc);
      temp.add(
          AvailabilityData(slots: doc.data['sessions'], day: doc.data['day']));
    }
    return temp;
  }

  Stream<List<AvailabilityData>> get availability {
    return availabilityData.snapshots().map(_availabilitySessionListFromJSON);
  }
}
