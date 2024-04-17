String noteFormatDate({required DateTime time}) {
  final year = time.year.toString();

  final String month = time.month.toString();

  final String day = time.day.toString();

  return '$day/$month/$year';
}
