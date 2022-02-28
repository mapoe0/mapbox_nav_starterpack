import 'package:intl/intl.dart';

// convert the reponse into an comprehensible time
String getDropOffTime(num duration) {
  int minutes = (duration / 60).round();
  int hours = 0;
  while (minutes > 60) {
    minutes -= 60;
    hours++;
  }
  String min = "";
  if (minutes < 10) {
    min = "0" + minutes.toString();
  } else {
    min = minutes.toString();
  }
  String time = hours.toString() + "h" + min;
  return time;
}
