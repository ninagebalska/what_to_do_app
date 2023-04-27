import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_to_do_app/domain/model/event_model.dart';

class EventDataBase {
  Stream<List<Event>> getEventsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('events')
        .orderBy('eventDate')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return Event(
            id: doc.id,
            title: doc['title'],
            eventDate: (doc['eventDate'] as Timestamp).toDate(),
          );
        },
      ).toList();
    });
  }
}