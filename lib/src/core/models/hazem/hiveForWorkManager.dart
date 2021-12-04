import 'dart:io';
import 'package:hive_flutter/adapters.dart';
import 'package:adhan/adhan.dart';
import 'package:path_provider/path_provider.dart';

class Prayer2 {
  final int id;
  final String name;
  final int hour;
  final int minute;
  final DateTime dateTime;

  Prayer2({
    this.id,
    this.name,
    this.hour,
    this.minute,
    this.dateTime,
  });
}

Future<List<Prayer2>> getPrayerForThisDAy() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  await Hive.initFlutter(appDocPath);
  await Hive.openBox('prayers');
  var box = Hive.box('prayers');
  int calculationMethod = 0;
  int madhab = 0;
  double lat = 45.533333;
  double long = 9.133333;
  int getCurrentCalculationMethod() {
    if (box.get('calculationMethod') == null) {
      box.put('calculationMethod', calculationMethod);
      return calculationMethod;
    } else {
      return box.get('calculationMethod');
    }
  }

  getCurrentMadhab() {
    if (box.get('madhab') == null) {
      box.put('madhab', madhab);
      return madhab;
    } else {
      return box.get('madhab');
    }
  }

  getCurrentLat() {
    if (box.get('latitude') == null) {
      box.put('latitude', lat);
      return lat;
    } else {
      return box.get('latitude');
    }
  }

  getCurrentLong() {
    if (box.get('longitude') == null) {
      box.put('longitude', long);
      return long;
    } else {
      return box.get('longitude');
    }
  }

  List<CalculationMethod> methods = [
    CalculationMethod.north_america,
    CalculationMethod.dubai,
    CalculationMethod.egyptian,
    CalculationMethod.karachi,
    CalculationMethod.kuwait,
    CalculationMethod.moon_sighting_committee,
    CalculationMethod.muslim_world_league,
    CalculationMethod.qatar,
    CalculationMethod.singapore,
    CalculationMethod.tehran,
    CalculationMethod.turkey,
    CalculationMethod.umm_al_qura,
  ];
  List<Madhab> madhabs = [Madhab.shafi, Madhab.hanafi];

  DateTime now = DateTime.now();
  final coordinates = Coordinates(getCurrentLat(), getCurrentLong());

  final nyDate = DateComponents(now.year, now.month, now.day);
  final nyParams = methods[getCurrentCalculationMethod()].getParameters();
  nyParams.madhab = madhabs[getCurrentMadhab()];
  final nyPrayerTimes = PrayerTimes(coordinates, nyDate, nyParams);

  List<Prayer2> prayers = [
    Prayer2(
        id: 0,
        name: "Fajr",
        hour: nyPrayerTimes.fajr.hour,
        minute: nyPrayerTimes.fajr.minute,
        dateTime: nyPrayerTimes.fajr),
    Prayer2(
        id: 1,
        name: "Duhr",
        hour: nyPrayerTimes.dhuhr.hour,
        minute: nyPrayerTimes.dhuhr.minute,
        dateTime: nyPrayerTimes.dhuhr),
    Prayer2(
        id: 2,
        name: "Asr",
        hour: nyPrayerTimes.asr.hour,
        minute: nyPrayerTimes.asr.minute,
        dateTime: nyPrayerTimes.asr),
    Prayer2(
        id: 3,
        name: "Maghreb",
        hour: nyPrayerTimes.maghrib.hour,
        minute: nyPrayerTimes.maghrib.minute,
        dateTime: nyPrayerTimes.maghrib),
    Prayer2(
        id: 4,
        name: "Isha",
        hour: nyPrayerTimes.isha.hour,
        minute: nyPrayerTimes.isha.minute,
        dateTime: nyPrayerTimes.isha),
  ];
  return prayers;
}

Future<List<Prayer2>> getPrayerForNextDay() async {
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  await Hive.initFlutter(appDocPath);
  await Hive.openBox('prayers');
  var box = Hive.box('prayers');
  int calculationMethod = 0;
  int madhab = 0;
  double lat = 45.533333;
  double long = 9.133333;

  int getCurrentCalculationMethod() {
    if (box.get('calculationMethod') == null) {
      box.put('calculationMethod', calculationMethod);
      return calculationMethod;
    } else {
      return box.get('calculationMethod');
    }
  }

  getCurrentMadhab() {
    if (box.get('madhab') == null) {
      box.put('madhab', madhab);
      return madhab;
    } else {
      return box.get('madhab');
    }
  }

  getCurrentLat() {
    if (box.get('latitude') == null) {
      box.put('latitude', lat);
      return lat;
    } else {
      return box.get('latitude');
    }
  }

  getCurrentLong() {
    if (box.get('longitude') == null) {
      box.put('longitude', long);
      return long;
    } else {
      return box.get('longitude');
    }
  }

  List<CalculationMethod> methods = [
    CalculationMethod.north_america,
    CalculationMethod.dubai,
    CalculationMethod.egyptian,
    CalculationMethod.karachi,
    CalculationMethod.kuwait,
    CalculationMethod.moon_sighting_committee,
    CalculationMethod.muslim_world_league,
    CalculationMethod.qatar,
    CalculationMethod.singapore,
    CalculationMethod.tehran,
    CalculationMethod.turkey,
    CalculationMethod.umm_al_qura,
  ];
  List<Madhab> madhabs = [Madhab.shafi, Madhab.hanafi];

  DateTime now = DateTime.now();
  final coordinates = Coordinates(getCurrentLat(), getCurrentLong());

  final nyDate = DateComponents(now.year, now.month, now.day + 1);
  final nyParams = methods[getCurrentCalculationMethod()].getParameters();
  nyParams.madhab = madhabs[getCurrentMadhab()];
  final nyPrayerTimes = PrayerTimes(coordinates, nyDate, nyParams);

  List<Prayer2> prayers = [
    Prayer2(
        id: 0,
        name: "Fajr",
        hour: nyPrayerTimes.fajr.hour,
        minute: nyPrayerTimes.fajr.minute,
        dateTime: nyPrayerTimes.fajr),
    Prayer2(
        id: 1,
        name: "Duhr",
        hour: nyPrayerTimes.dhuhr.hour,
        minute: nyPrayerTimes.dhuhr.minute,
        dateTime: nyPrayerTimes.dhuhr),
    Prayer2(
        id: 2,
        name: "Asr",
        hour: nyPrayerTimes.asr.hour,
        minute: nyPrayerTimes.asr.minute,
        dateTime: nyPrayerTimes.asr),
    Prayer2(
        id: 3,
        name: "Maghreb",
        hour: nyPrayerTimes.maghrib.hour,
        minute: nyPrayerTimes.maghrib.minute,
        dateTime: nyPrayerTimes.maghrib),
    Prayer2(
        id: 4,
        name: "Isha",
        hour: nyPrayerTimes.isha.hour,
        minute: nyPrayerTimes.isha.minute,
        dateTime: nyPrayerTimes.isha),
  ];
  return prayers;
}
