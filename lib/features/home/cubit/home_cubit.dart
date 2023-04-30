import 'dart:async';

import 'package:bloc/bloc.dart';
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

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }






}
