import 'package:intl/intl.dart';

DateTime convertToDateTime(String dateString, String timeString) {
  // Combine the date and time strings
  String dateTimeString = '\$dateString \$timeString';

  // Specify the format of the input strings
  // For example, if the date is in the format 'yyyy-MM-dd' and time is in 'HH:mm:ss'
  final format = DateFormat('yyyy-MM-dd HH:mm:ss');

  // Parse the combined string into a DateTime object
  DateTime dateTime = format.parse(dateTimeString);

  return dateTime;
}
