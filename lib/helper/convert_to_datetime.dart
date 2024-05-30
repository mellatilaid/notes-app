import 'package:intl/intl.dart';

String convertToDateTime(String dateString, String timeString) {
  // Combine the date and time strings
  String dateTimeString = '$dateString $timeString';
  // Specify the format of the input strings
  // For example, if the date is in the format 'yyyy-MM-dd' and time is in 'HH:mm:ss'
  final originalFormat = DateFormat('dd/MM/yyyy HH:mm');
  // Parse the combined string into a DateTime object
  DateTime dateTime = originalFormat.parse(dateTimeString);

// Format the DateTime object to the new format
  DateFormat newFormat = DateFormat('yyyy-MM-dd HH:mm');
  String newDateString = newFormat.format(dateTime);
  return newDateString;
}
