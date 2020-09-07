import 'package:intl/intl.dart';

class DateUtil {
  String getTodayDate() {
    DateTime now = new DateTime.now();
    DateFormat formatter = new DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  String formatDate({DateTime dateTime, String format}) {
    DateFormat formatter = new DateFormat(format);
    return formatter.format(dateTime);
  }
}
