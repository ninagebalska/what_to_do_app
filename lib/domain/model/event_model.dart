import 'package:intl/intl.dart';

class Event {
  Event({
    required this.title,
    required this.eventDate,
    required this.id,
  });

  final String title;
  final DateTime eventDate;
  final String id;

  String eventDateFormatted() {
    return DateFormat.yMMMEd().format(eventDate);
  }
}
