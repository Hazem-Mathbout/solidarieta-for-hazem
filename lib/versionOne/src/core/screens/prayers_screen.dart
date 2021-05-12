import 'dart:async';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:solidarieta/versionOne/src/core/components/widgets/date_in_italiano.dart';
import 'package:solidarieta/versionOne/src/core/components/widgets/home_prayers_table.dart';
import 'package:solidarieta/versionOne/src/core/providers/times_provider.dart';

class PrayerTimings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var time = Provider.of<Times>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (t) {
      time.updateTimes();
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Times>(builder: (context, data, child) {
        return Container(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
            children: [
              Column(
                children: [
                  Container(
                    height: 150.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(height: 10.0),
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
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    "${formatChecker(data.getCurrentHour())} : ${formatChecker(data.getCurrentMinute())} : ${formatChecker(data.getCurrentSeconde())}",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Prayers(),
            ],
          ),
        );
      }),
    );
  }
}

String formatChecker(int number) {
  if (number > 9)
    return number.toString();
  else
    return "0" + number.toString();
}
