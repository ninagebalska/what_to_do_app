import 'package:bloc/bloc.dart';
import 'package:what_to_do_app/domain/repositories/events_repository.dart';


part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit(this._eventsRepository) : super(AddState());

  final EventsRepository _eventsRepository;

  Future<void> add(
    String title,
    DateTime eventDate,
  ) async {
    try {
      await _eventsRepository.add(title, eventDate);
      emit(AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
