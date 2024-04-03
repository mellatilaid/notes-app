String formateTime(int milliseconds) {
  int seconds = (milliseconds / 1000).floor();
  int minutes = (seconds / 60).floor();
  int hours = (minutes / 60).floor();

  String hoursStr = (hours % 24).toString().padLeft(2, '0');
  String minutesStr = (minutes % 60).toString().padLeft(2, '0');
  String secondsStr = (seconds % 60).toString().padLeft(2, '0');

  return "$hoursStr:$minutesStr:$secondsStr";
}
