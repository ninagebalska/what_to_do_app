part of 'home_cubit.dart';

class HomeState {
    const HomeState(
      {this.events = const [],
      this.loadingErrorOccured = false,
      this.removingErrorOccured = false});

  final List<Event> events;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
