import 'package:intl/intl.dart';

class FormatTime {
  FormatTime();

  String formatDateTime(DateTime dateTime) {
    return DateFormat(
            'EEEE, d\'${_getDaySuffix(dateTime.day)}\' of MMMM \'at\' h:mma')
        .format(dateTime);
  }

  String _getDaySuffix(int day) {
    if (day >= 11 && day <= 13) {
      return 'th';
    }
    switch (day % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
