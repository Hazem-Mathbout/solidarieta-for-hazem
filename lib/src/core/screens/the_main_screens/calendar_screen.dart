import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/components/widgets/date_in_italiano.dart';
import 'package:solidarieta/src/core/providers/prayers_configuration_provider.dart.dart';
import 'package:solidarieta/src/core/providers/times_provider.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateFormat monthFormat;
  @override
  Widget build(BuildContext context) {
    int _currentMonthLength;
    monthFormat = DateFormat.MMMM('it');
    var settings = Provider.of<PrayerSettingsProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Times>(
        builder: (context, data, child) {
          _currentMonthLength =
              DateTime(data.getCurrentYear(), data.getCurrentMonth() + 1, 0)
                  .day;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Column(
              children: [
                CompleteDayName(),
                SizedBox(height: 3.0),
                Text(
                  formatChecker(data.getCurrentDayHijri()) +
                      "  " +
                      data.getCurrentMonthHijriName() +
                      "  " +
                      data.getCurrentYearHijri().toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Calendario di : ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "${toUpperCase(monthFormat.format(data.getCurrentDateTime()))}",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Hel ",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("Fajr", style: styleOne()),
                      Text("Shoruq", style: styleOne()),
                      Text("Duhr", style: styleOne()),
                      Text("Asr", style: styleOne()),
                      Text("Maghrib", style: styleOne()),
                      Text("Isha", style: styleOne()),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _currentMonthLength,
                      itemBuilder: (context, index) {
                        PrayerTimes day = dayPrayers(
                            data.getCurrentMonth(),
                            index + 1,
                            data.getCurrentYear(),
                            settings.getCurrentCalculationMethod(),
                            settings.getCurrentMadhab(),
                            settings.getCurrentLat(),
                            settings.getCurrentLong());

                        return rowee(index + 1, day.fajr, day.sunrise,
                            day.dhuhr, day.asr, day.maghrib, day.isha);
                      }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

rowee(int day, DateTime fajr, DateTime shoruq, DateTime duhr, DateTime asr,
    DateTime maghrib, DateTime isha) {
  int a = day % 2;
  String theDay = day.toString();
  if (day < 10) theDay = "0" + day.toString();
  return Container(
    height: 20,
    color: a != 0 ? Color.fromRGBO(0, 133, 119, 0.3) : Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Text(
              theDay,
              style: styleOne(),
            ),
          ),
          Expanded(child: Text(time(fajr))),
          Expanded(child: Text(time(shoruq))),
          Expanded(child: Text(time(duhr))),
          Expanded(child: Text(time(asr))),
          Expanded(child: Text(time(maghrib))),
          Expanded(child: Text(time(isha))),
        ],
      ),
    ),
  );
}

PrayerTimes dayPrayers(int mmonth, int dday, int yyear, int method, int madhab,
    double lat, double long) {
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

  final milan = Coordinates(lat, long);
  final nyDate = DateComponents(yyear, mmonth, dday);
  final nyParams = methods[method].getParameters();
  nyParams.madhab = madhabs[madhab];
  return PrayerTimes(milan, nyDate, nyParams);
  // final nyPrayerTimes =
  //     PrayerTimes(milan, nyDate, nyParams, utcOffset: nyUtcOffset);
}

String time(DateTime date) => DateFormat.Hm().format(date);

TextStyle styleOne() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);
}
