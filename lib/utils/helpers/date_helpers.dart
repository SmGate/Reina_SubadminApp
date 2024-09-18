import 'package:intl/intl.dart';

class DateHelpers {
  String formatDate(String dateString) {
    try {
      // Parse the input date string
      DateTime date = DateTime.parse(dateString);

      // Format the date into 'yyyy-MM-dd' format
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);

      return formattedDate;
    } catch (e) {
      // Handle any parsing errors
      return 'Invalid date format';
    }
  }
}
