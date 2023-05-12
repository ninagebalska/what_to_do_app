import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_to_do_app/domain/model/event_model.dart';

class EventsRepository {
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
  
  Future<Event> get({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('events')
        .doc(id)
        .get();
    return Event(
      id: doc.id,
      title: doc['title'],
      eventDate: (doc['eventDate'] as Timestamp).toDate(),
    );
  }

  Future<void> add(
    String title,
    DateTime eventDate,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('events')
        .add(
      {
        'title': title,
        'eventDate': eventDate,
      },
    );
  }

  
}
