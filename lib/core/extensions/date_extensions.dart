import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  int get daysDifferenceFromToday {
    final today = DateTime.now();
    final difference = this.difference(today);

    return (difference.inHours / 24).round();
  }

  String get hoursAndMinutes {
    final dateFormat = DateFormat.Hm();

    return dateFormat.format(this);
  }

  String get dayAndMonth {
    final dateFormat = DateFormat.Md();

    return dateFormat.format(this);
  }
}
