import 'package:intl/intl.dart';

class DateTimee {
  static String formatDateTime(String inputDatetime) {
    var inputDateFormat = DateFormat('yyyy-MM-ddThh:mm:ssZ');
    var outputDateFormat = DateFormat('dd/MMM/yyyy & hh:mm a');
    var inputDate = inputDateFormat.parse(inputDatetime);
    var outputDate = outputDateFormat.format(inputDate);
    return outputDate;
  }
}
