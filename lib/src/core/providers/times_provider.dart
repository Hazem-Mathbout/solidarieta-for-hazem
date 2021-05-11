import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class Times extends ChangeNotifier {
  // String _currentDay = DateFormat('jms').format(DateTime.now());
  int _currentDay = DateTime.now().day;
  int _currentMonth = DateTime.now().month;
  int _currentYear = DateTime.now().year;
  int _currentHour = DateTime.now().hour;
  int _currentMinute = DateTime.now().minute;
  int _currentSeconde = DateTime.now().second;

  int _currentDayHijri = HijriCalendar.now().hDay;
  int _currentMonthHijri = HijriCalendar.now().hMonth;
  int _currentYearHijri = HijriCalendar.now().hYear;

  String _currentMonthHijriName = HijriCalendar.now().longMonthName;
  getCurrentMonthHijriName() => _currentMonthHijriName;

  getCurrentDay() => _currentDay;
  getCurrentMonth() => _currentMonth;
  getCurrentYear() => _currentYear;
  getCurrentHour() => _currentHour;
  getCurrentMinute() => _currentMinute;
  getCurrentSeconde() => _currentSeconde;
  getCurrentDayHijri() => _currentDayHijri;
  getCurrentMonthHijri() => _currentMonthHijri;
  getCurrentYearHijri() => _currentYearHijri;

  updateTimes() {
    _currentDay = DateTime.now().day;
    _currentMonth = DateTime.now().month;
    _currentYear = DateTime.now().year;
    _currentHour = DateTime.now().hour;
    _currentMinute = DateTime.now().minute;
    _currentSeconde = DateTime.now().second;

    _currentDayHijri = HijriCalendar.now().hDay;
    _currentMonthHijri = HijriCalendar.now().hMonth;
    _currentYearHijri = HijriCalendar.now().hYear;

    _currentMonthHijriName = HijriCalendar.now().longMonthName;

    notifyListeners();
  }
}
