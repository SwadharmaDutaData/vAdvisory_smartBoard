part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String get getAppDate =>
      "${this.shortDayName}, ${this.day} ${this.monthName} ${this.year}";

  String get getAppDateSeparator => (this.month <= 9)
      ? (this.day <= 9)
      ? "${this.year}-0${this.month}-0${this.day}"
      : "${this.year}-0${this.month}-${this.day}"
      : (this.day <= 9)
      ? "${this.year}-${this.month}-0${this.day}"
      : "${this.year}-${this.month}-${this.day}";

  bool isSameDate(DateTime checkout) =>
      year == checkout.year && month == checkout.month && day == checkout.day;

  String get getAppTime => (this.hour <= 9)
      ? (this.minute <= 9)
          ? (this.second <= 9)
              ? "0${this.hour} : 0${this.minute} WIB"
              : "0${this.hour} : 0${this.minute} WIB"
          : (this.second <= 9)
              ? "0${this.hour} : ${this.minute} WIB"
              : "0${this.hour} : ${this.minute} WIB"
      : (this.minute <= 9) /// hour > 9
          ? (this.second <= 9)
              ? "${this.hour} : 0${this.minute} WIB"
              : "${this.hour} : 0${this.minute} WIB"
          : (this.second <= 9)
              ? "${this.hour} : ${this.minute} WIB"
              : "${this.hour} : ${this.minute} WIB";

  String get getNameImage =>
      "${this.shortDayName}${this.day}${this.monthName}-${this.year}${this.hour}${this.minute}${this.second}${this.millisecond}";

  String get shortDayName {
    switch (this.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      default:
        return 'Sun';
    }
  }

  String get dayName {
    ///mengubah tanggal pada lib datetime
    switch (this.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      default:
        return 'Sunday';
    }
  }

  String get monthName {
    ///mengubah tanggal pada lib datetime
    switch (this.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      default:
        return 'Dec';
    }
  }
}
