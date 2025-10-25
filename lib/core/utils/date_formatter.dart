import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    final formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(date);
  }

  static String formatMonthYear(DateTime date) {
    final formatter = DateFormat('MMM yyyy');
    return formatter.format(date);
  }
}
