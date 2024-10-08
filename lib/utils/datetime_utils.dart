import 'package:intl/intl.dart';

class DateTimeUtils {
  static final DateFormat dateFormat = DateFormat('MM/dd/yyyy');

  static String formatDate(DateTime date) {
    return dateFormat.format(date);
  }
}
