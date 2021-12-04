import 'package:adhan/adhan.dart';
import 'package:hive/hive.dart';

class Prayer {
  final int id;
  final String name;
  final int hour;
  final int minute;
  final DateTime dateTime;

  Prayer({
    this.id,
    this.name,
    this.hour,
    this.minute,
    this.dateTime,
  });
}

// ------------ List of Prayers ------------ use this method whenever you want to get the lastest times of prayers
List<Prayer> getPrayers() {
  // added code : hazem
  var settings = Hive.box('prayers');
  int calculationMethod = settings.get('calculationMethod');
  int madhab = settings.get('madhab');
  double lat = settings.get('latitude');
  double long = settings.get('longitude');

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

  // end

  /* hazem : this is your code
  DateTime now = DateTime.now();
  final milan = Coordinates(45.464664, 9.188540);

  final nyDate = DateComponents(now.year, now.month, now.day);
  final nyParams = CalculationMethod.north_america.getParameters();
  nyParams.madhab = Madhab.shafi;
  final nyPrayerTimes = PrayerTimes(milan, nyDate, nyParams);
*/

// this is edited code : hazem
  DateTime now = DateTime.now();
  final coordinates = Coordinates(lat, long);

  final nyDate = DateComponents(now.year, now.month, now.day);
  final nyParams = methods[calculationMethod].getParameters();
  nyParams.madhab = madhabs[madhab];
  final nyPrayerTimes = PrayerTimes(coordinates, nyDate, nyParams);

  List<Prayer> prayers = [
    Prayer(
        id: 0,
        name: "Fajr",
        hour: nyPrayerTimes.fajr.hour,
        minute: nyPrayerTimes.fajr.minute,
        dateTime: nyPrayerTimes.fajr),
    Prayer(
        id: 1,
        name: "Duhr",
        hour: nyPrayerTimes.dhuhr.hour,
        minute: nyPrayerTimes.dhuhr.minute,
        dateTime: nyPrayerTimes.dhuhr),
    Prayer(
        id: 2,
        name: "Asr",
        hour: nyPrayerTimes.asr.hour,
        minute: nyPrayerTimes.asr.minute,
        dateTime: nyPrayerTimes.asr),
    Prayer(
        id: 3,
        name: "Maghreb",
        hour: nyPrayerTimes.maghrib.hour,
        minute: nyPrayerTimes.maghrib.minute,
        dateTime: nyPrayerTimes.maghrib),
    Prayer(
        id: 4,
        name: "Isha",
        hour: nyPrayerTimes.isha.hour,
        minute: nyPrayerTimes.isha.minute,
        dateTime: nyPrayerTimes.isha),
  ];
  return prayers;
}

// This function returns the next prayer depending on current time
Prayer getNextPrayer() {
  List<Prayer> prayers = getPrayers();
  DateTime now = DateTime.now().toUtc();
  Prayer nextPrayer = prayers[0];
  for (var i = 0; i < 5; i++) {
    if (now.hour < prayers[i].hour) {
      nextPrayer = prayers[i];
      break;
    } else if (prayers[i].hour == now.hour && prayers[i].minute >= now.minute) {
      nextPrayer = prayers[i];
      break;
    }
  }
  return nextPrayer;
}
