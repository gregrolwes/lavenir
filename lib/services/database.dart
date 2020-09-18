import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lavenir/models/announcement.dart';
import 'package:lavenir/models/day.dart';
import 'package:lavenir/models/session.dart';
import 'package:lavenir/models/user.dart';
import 'package:lavenir/models/availability_model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference announcementsCollection =
      Firestore.instance.collection('announcements');
  final CollectionReference scheduleCollection =
      Firestore.instance.collection('schedule');
  final CollectionReference brewCollection =
      Firestore.instance.collection('availability');

  Future<void> updateUserData(List<AvailabilityDay> data) async {
    return await brewCollection
        .document(uid)
        .setData({'availabilityData': data});
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

  // List<AvailabilitySession> _availabilitySessionListFromJSON(List rawSessions) {
  //   return rawSessions.map((session) {
  //     return AvailabilitySession(
  //         time: session['time'] ?? '', availability: session['time'] ?? false);
  //   }).toList();
  // }

  // List<AvailabilityDay> _availabilityDayListFromSnapshot(
  //     QuerySnapshot snapshot) {
  //   return snapshot.documents.map((doc) {
  //     return AvailabilityDay(
  //       day: doc.data['day'] ?? '',
  //       availabilitySessions: _sessionListFromJSON(doc.data['sessions']) ??
  //           List<AvailabilitySession>(),
  //     );
  //   }).toList();
  // }
  List<AvailabilityData> _availabilitySessionListFromJSON(
      QuerySnapshot snapshot) {
    List<AvailabilityData> temp = new List();
    for (var doc in snapshot.documents) {
      print(doc);
      temp.add(
          AvailabilityData(slots: doc.data['sessions'], day: doc.data['day']));
    }
    return temp;
  }

  Stream<List<AvailabilityData>> get availability {
    return brewCollection.snapshots().map(_availabilitySessionListFromJSON);
  }
}
