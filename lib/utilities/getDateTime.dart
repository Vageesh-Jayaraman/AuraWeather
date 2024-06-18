import 'package:intl/intl.dart';

class DateTimeFormatter {
  String formatDate(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('d MMM').format(parsedDate);
  }

  String formatTime(String dateTime) {
    DateTime parsedDate = DateTime.parse(dateTime);
    return DateFormat('h:mm a').format(parsedDate);
  }
}

