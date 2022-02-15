import 'package:playlist_duration/models/duration.dart';

Future<Duration> toDuration(String isoString) async {
  if (!RegExp(
          r"^(-|\+)?P(?:([-+]?[0-9,.]*)Y)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)W)?(?:([-+]?[0-9,.]*)D)?(?:T(?:([-+]?[0-9,.]*)H)?(?:([-+]?[0-9,.]*)M)?(?:([-+]?[0-9,.]*)S)?)?$")
      .hasMatch(isoString)) {
    throw ArgumentError("String does not follow correct format");
  }

  final weeks = _parseTime(isoString, "W");
  final days = _parseTime(isoString, "D");
  final hours = _parseTime(isoString, "H");
  final minutes = _parseTime(isoString, "M");
  final seconds = _parseTime(isoString, "S");

  return Duration(
    days: days + (weeks * 7),
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  );
}

int _parseTime(String duration, String timeUnit) {
  final timeMatch = RegExp(r"\d+" + timeUnit).firstMatch(duration);

  if (timeMatch == null) {
    return 0;
  }
  final timeString = timeMatch.group(0);

  return int.parse(timeString.substring(0, timeString.length - 1));
}

DurationInfo _formatDuration(Duration duration, double speed) {
  var seconds = duration.inSeconds ~/ speed;
  final days = seconds ~/ Duration.secondsPerDay;
  seconds -= days * Duration.secondsPerDay;
  final hours = seconds ~/ Duration.secondsPerHour;
  seconds -= hours * Duration.secondsPerHour;
  final minutes = seconds ~/ Duration.secondsPerMinute;
  seconds -= minutes * Duration.secondsPerMinute;
  
  return DurationInfo(
      days: days, hours: hours, minutes: minutes, seconds: seconds);
}

Durations calcDuration(DateTime dateAfter, int count) {
  DateTime date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  Duration duration = dateAfter.difference(date);
  Duration avg = duration ~/ count;
  return Durations(
    x100: _formatDuration(duration, 1.0),
    x125: _formatDuration(duration, 1.25),
    x150: _formatDuration(duration, 1.50),
    x175: _formatDuration(duration, 1.75),
    x200: _formatDuration(duration, 2.0),
    avg:  _formatDuration(avg, 1.0)
  );
}
