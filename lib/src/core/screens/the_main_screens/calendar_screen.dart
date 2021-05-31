import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/components/widgets/date_in_italiano.dart';
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Times>(
        builder: (context, data, child) {
          _currentMonthLength =
              DateTime(data.getCurrentYear(), data.getCurrentMonth() + 1, 0)
                  .day;

          return Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
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
                SizedBox(height: 20.0),
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
                SizedBox(height: 20.0),
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
                        PrayerTimes day = dayPrayers(data.getCurrentMonth(),
                            index + 1, data.getCurrentYear());

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

PrayerTimes dayPrayers(int mmonth, int dday, int yyear) {
  final milan = Coordinates(45.464664, 9.188540);
  final nyUtcOffset = Duration(hours: 2);
  final nyDate = DateComponents(yyear, mmonth, dday);
  final nyParams = CalculationMethod.north_america.getParameters();
  nyParams.madhab = Madhab.shafi;
  return PrayerTimes(milan, nyDate, nyParams, utcOffset: nyUtcOffset);
  // final nyPrayerTimes =
  //     PrayerTimes(milan, nyDate, nyParams, utcOffset: nyUtcOffset);
}

String time(DateTime date) => DateFormat.Hm().format(date);

TextStyle styleOne() {
  return TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0);
}
