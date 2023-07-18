import 'package:bloc/bloc.dart';
import 'package:what_to_do_app/domain/repositories/events_repository.dart';

part 'add_state.dart';

class AddCubit extends Cubit<AddState> {
  AddCubit({required this.eventsRepository}) : super(AddState());

  final EventsRepository eventsRepository;

  Future<void> add({required String title, required DateTime eventDate}) async {
    try {
      await eventsRepository.add(title, eventDate);
      emit(AddState(saved: true));
    } catch (error) {
      emit(AddState(errorMessage: error.toString()));
    }
  }
}
