import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/meteocons_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/providers/times_provider.dart';

class Prayers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 305,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 133, 119, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 133, 119, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Preghiera",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "L'Attesa",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    "Adhan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Consumer<Times>(
            builder: (context, data, child) {
              return Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.8),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 13),
                  child: dayPrayers(data.getCurrentMonth(),
                      data.getCurrentDay(), data.getCurrentYear()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

aPrayer(String preghiera, String adhan, String attesa, IconData icon) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 10),
    child: Container(
      // height: 35,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 133, 119, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90.0,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Text(
                    preghiera,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  attesa,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 30)
              ],
            ),
            Text(
              adhan,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    ),
  );
}

dayPrayers(int mmonth, int dday, int yyear) {
  final milan = Coordinates(45.464664, 9.188540);
  int utc = 1;
  // in italia UTC between 28 Mar - 31 Oct is : +2
  if ((mmonth == 3 && dday >= 28) || (mmonth > 3 && mmonth < 11)) utc = 2;

  final nyUtcOffset = Duration(hours: utc);
  final nyDate = DateComponents(yyear, mmonth, dday);
  final nyParams = CalculationMethod.north_america.getParameters();
  nyParams.madhab = Madhab.shafi;
  final nyPrayerTimes =
      PrayerTimes(milan, nyDate, nyParams, utcOffset: nyUtcOffset);

  return Column(
    children: [
      aPrayer("Fajr", time(nyPrayerTimes.fajr), "20 min", Meteocons.fog_moon),
      aPrayer("Shoruq", time(nyPrayerTimes.sunrise), "", Meteocons.fog_sun),
      aPrayer("Duhr", time(nyPrayerTimes.dhuhr), "10 min", Meteocons.sun),
      aPrayer("Asr", time(nyPrayerTimes.asr), "10 min", Meteocons.cloud_sun),
      aPrayer("Maghrib", time(nyPrayerTimes.maghrib), "05 min",
          Meteocons.cloud_moon),
      aPrayer("Isha", time(nyPrayerTimes.isha), "10 min", Meteocons.moon),
    ],
  );
}

String time(DateTime date) => DateFormat.Hm().format(date);
