import 'package:intl/intl.dart';

String greetingTime() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Selamat Pagi';
  } else if (hour < 18) {
    return 'Selamat Siang';
  } else {
    return 'Selamat Malam';
  }
}

String getThisMonth() {
  final now = DateTime.now();
  final formatter = DateFormat('MMMM', 'ID');
  return formatter.format(now);
}
