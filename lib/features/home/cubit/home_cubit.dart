import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:what_to_do_app/data/event_db.dart';
import 'package:what_to_do_app/domain/model/event_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._eventDataBase) : super(const HomeState());

  final EventDataBase _eventDataBase;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _eventDataBase.getEventsStream().listen(
      (events) {
        emit(HomeState(events: events));
      },
    )..onError(
        (error) {
          emit(const HomeState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> delete({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('events')
          .doc(id)
          .delete();
    } catch (error) {
      emit(
        const HomeState(removingErrorOccured: true),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
