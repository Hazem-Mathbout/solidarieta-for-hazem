import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class Times extends ChangeNotifier {
  DateTime _currentDateTime = DateTime.now();
  getCurrentDateTime() => _currentDateTime;
  getCurrentDay() => _currentDateTime.day;
  getCurrentMonth() => _currentDateTime.month;
  getCurrentYear() => _currentDateTime.year;
  getCurrentHour() => _currentDateTime.hour;
  getCurrentMinute() => _currentDateTime.minute;
  getCurrentSeconde() => _currentDateTime.second;

  HijriCalendar _hijri = HijriCalendar.now();
  getHijri() => _hijri;

  getCurrentDayHijri() => _hijri.hDay;
  getCurrentMonthHijri() => _hijri.hMonth;
  getCurrentYearHijri() => _hijri.hYear;
  getCurrentMonthHijriName() => _hijri.longMonthName;

  updateTimes() {
    _currentDateTime = DateTime.now();
    _hijri = HijriCalendar.now();

    notifyListeners();
  }
}
