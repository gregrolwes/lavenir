import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lavenir/models/announcement.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference announcementsCollection = Firestore.instance.collection('announcements');

  List<Announcement> _announcementListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Announcement(
        title: doc.data['title'] ?? 'Announcement',
        date: DateTime.parse(doc.data['content'].toDate().toString()) ?? DateTime.now(),
        content: doc.data['content'] ?? '',
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Announcement>> get brews {
    return announcementsCollection.snapshots()
      .map(_announcementListFromSnapshot);
  }
}