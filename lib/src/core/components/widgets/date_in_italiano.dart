import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/providers/times_provider.dart';

class CompleteDayName extends StatefulWidget {
  @override
  _CompleteDayNameState createState() => _CompleteDayNameState();
}

class _CompleteDayNameState extends State<CompleteDayName> {
  DateFormat dayFormat;
  DateFormat monthFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    dayFormat = DateFormat.EEEE('it');
    monthFormat = DateFormat.MMMM('it');

    return Consumer<Times>(
      builder: (context, data, child) => Text(
        "${toUpperCase(dayFormat.format(data.getCurrentDateTime()))}, " +
            formatChecker(data.getCurrentDay()) +
            " ${toUpperCase(monthFormat.format(data.getCurrentDateTime()))} " +
            data.getCurrentYear().toString(),
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

String toUpperCase(String text) {
  return toBeginningOfSentenceCase(text);
}

String formatChecker(int number) {
  if (number > 9)
    return number.toString();
  else
    return "0" + number.toString();
}
