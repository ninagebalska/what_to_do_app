import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:what_to_do_app/domain/model/event_model.dart';
import 'package:what_to_do_app/domain/repositories/events_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._eventsRepository) : super(const HomeState());

  final EventsRepository _eventsRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _eventsRepository.getEventsStream().listen(
      (events) {
        emit(HomeState(events: events));
      },
    )..onError(
        (error) {
          emit(const HomeState(loadingErrorOccured: true));
        },
      );
  }

  Future<void> remove({required String id}) async {
    try {
      _eventsRepository.delete(id: id);
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
