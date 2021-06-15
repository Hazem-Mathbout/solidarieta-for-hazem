import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';

class Prayer {
  final int id;
  final String name;
  final int hour;
  final int minute;

  Prayer({
    @required this.id,
    @required this.name,
    @required this.hour,
    @required this.minute,
  });
}

Prayer getNextPrayer() {
// creation of the list of prayers
  DateTime now = DateTime.now();
  final milan = Coordinates(45.464664, 9.188540);

  int utc = 1;
  // in italia UTC between 28 Mar - 31 Oct is : +2
  if ((now.month == 3 && now.day >= 28) || (now.month > 3 && now.month < 11))
    utc = 2;
  final nyUtcOffset = Duration(hours: utc);

  final nyDate = DateComponents(now.year, now.month, now.day);
  final nyParams = CalculationMethod.north_america.getParameters();
  nyParams.madhab = Madhab.shafi;
  final nyPrayerTimes =
      PrayerTimes(milan, nyDate, nyParams, utcOffset: nyUtcOffset);

  List<Prayer> prayers = [
    Prayer(
      id: 0,
      name: "Fajr",
      hour: nyPrayerTimes.fajr.hour,
      minute: nyPrayerTimes.fajr.minute,
    ),
    Prayer(
      id: 1,
      name: "Duhr",
      hour: nyPrayerTimes.dhuhr.hour,
      minute: nyPrayerTimes.dhuhr.minute,
    ),
    Prayer(
      id: 2,
      name: "Asr",
      hour: nyPrayerTimes.asr.hour,
      minute: nyPrayerTimes.asr.minute,
    ),
    Prayer(
      id: 3,
      name: "Maghreb",
      hour: nyPrayerTimes.maghrib.hour,
      minute: nyPrayerTimes.maghrib.minute,
    ),
    Prayer(
      id: 4,
      name: "Isha",
      hour: nyPrayerTimes.isha.hour,
      minute: nyPrayerTimes.isha.minute,
    ),
  ];

  Prayer nextPrayer = prayers[0];

  for (var i = 0; i < 5; i++) {
    if (now.hour < prayers[i].hour) {
      nextPrayer = prayers[i];
      break;
    } else if (prayers[i].hour == now.hour && now.minute >= prayers[i].minute) {
      nextPrayer = prayers[i];
      break;
    }
  }

  return nextPrayer;
}

// TODO : Be careful it can return a negative value : Solution - don't send notification if it is negative
int timeToNextPrayer(Prayer nextPrayer) {
  int nowH = DateTime.now().hour;
  int nowM = DateTime.now().minute;
  int seconds;
  seconds = (nextPrayer.hour * 3600 + nextPrayer.minute * 60) -
      (nowH * 3600 + nowM * 60);
  return seconds;
}
