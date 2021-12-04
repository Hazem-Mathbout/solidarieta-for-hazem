// ignore_for_file: avoid_print

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:solidarieta/main.dart';
import 'package:solidarieta/src/core/models/hazem/hiveForWorkManager.dart';
import 'package:solidarieta/src/core/models/hazem/notifications_state.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void callBackDispatcher() async {
  WidgetsFlutterBinding.ensureInitialized();
  initNotifications() async {
    tz.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('solidarieta_logo');
    var initializationSettingsIOS = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: (id, title, body, payload) async {});
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint('notification payload: ' + payload);
      }
    });
  }

  Future scheduleAlarm(int id, String title, String body, String prayer) async {
    DateTime scheduledNotificationDateTime = await selectAlarmDateTime(prayer);
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'alarm_notif', 'alarm_notif',
        icon: 'solidarieta_logo',
        // playSound: true,
        // sound: RawResourceAndroidNotificationSound('a_long_cold_sting.wav'),
        largeIcon: DrawableResourceAndroidBitmap('solidarieta_logo'),
        importance: Importance.max);

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',
        presentAlert: true,
        presentBadge: true,
        presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Workmanager().executeTask((taskName, inputData) async {
    List<int> listID = await getIdForNotifications();
    List<bool> listNotifi = await getSharedPrefrences();
    await initNotifications();

    if (listNotifi[0] == true) {
      print("Fajr : Done");
      await scheduleAlarm(listID[0], await getTitlePrayer("Fajr"),
          await getBodyPrayer("Fajr"), "Fajr");
    }
    if (listNotifi[1] == true) {
      print("Duher : Done");

      await scheduleAlarm(listID[1], await getTitlePrayer("Duhr"),
          await getBodyPrayer("Duhr"), "Duhr");
    }
    if (listNotifi[2] == true) {
      print("Asr : Done");

      await scheduleAlarm(listID[2], await getTitlePrayer("Asr"),
          await getBodyPrayer("Asr"), "Asr");
    }
    if (listNotifi[3] == true) {
      print("Maghreb : Done");

      await scheduleAlarm(listID[3], await getTitlePrayer("Maghreb"),
          await getBodyPrayer("Maghreb"), "Maghreb");
    }
    if (listNotifi[4] == true) {
      print("Isha : Done");

      await scheduleAlarm(listID[4], await getTitlePrayer("Isha"),
          await getBodyPrayer("Isha"), "Isha");
    }

    return Future.value(true);
  });
}

Future<List<int>> getIdForNotifications() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int idFajr = (prefs.getInt("0") ?? 0) + 5;
  int idDuhr = (prefs.getInt("1") ?? 1) + 5;
  int idAsr = (prefs.getInt("2") ?? 2) + 5;
  int idMaghreb = (prefs.getInt("3") ?? 3) + 5;
  int idIsha = (prefs.getInt("4") ?? 4) + 5;
  prefs.setInt("0", idFajr);
  prefs.setInt("1", idDuhr);
  prefs.setInt("2", idAsr);
  prefs.setInt("3", idMaghreb);
  prefs.setInt("4", idIsha);
  List<int> listID = [idFajr, idDuhr, idAsr, idMaghreb, idIsha];
  return listID;
}

Future<String> getTitlePrayer(String name) async {
  List<Prayer2> prayerForThisDAy = await getPrayerForThisDAy();
  String title;
  if (name == "Fajr") {
    title = "Salat Al ${prayerForThisDAy[0].name} 🤲";
  } else if (name == "Duhr") {
    title = "Salat Al ${prayerForThisDAy[1].name} 🤲";
  } else if (name == "Asr") {
    title = "Salat Al ${prayerForThisDAy[2].name} 🤲";
  } else if (name == "Maghreb") {
    title = "Salat Al ${prayerForThisDAy[3].name} 🤲";
  } else {
    title = "Salat Al ${prayerForThisDAy[4].name} 🤲";
  }
  return title;
}

Future<bool> nowIsAfterPrayer(String prayer) async {
  bool res;
  DateTime now = DateTime.now();
  List<Prayer2> prayerForThisDAy = await getPrayerForThisDAy();
  List<DateTime> listPrayerTime = [];
  for (int i = 0; i < 5; i++) {
    listPrayerTime.add(prayerForThisDAy[i].dateTime);
  }
  if (prayer == "Fajr") {
    if (now.isAfter(listPrayerTime[0])) {
      res = true;
    } else {
      res = false;
    }
  } else if (prayer == "Duhr") {
    if (now.isAfter(listPrayerTime[1])) {
      res = true;
    } else {
      res = false;
    }
  } else if (prayer == "Asr") {
    if (now.isAfter(listPrayerTime[2])) {
      res = true;
    } else {
      res = false;
    }
  } else if (prayer == "Maghreb") {
    if (now.isAfter(listPrayerTime[3])) {
      res = true;
    } else {
      res = false;
    }
  } else {
    if (now.isAfter(listPrayerTime[4])) {
      res = true;
    } else {
      res = false;
    }
  }
  return res;
}

Future<String> getBodyPrayer(String name) async {
  List<Prayer2> prayerForThisDAy = await getPrayerForThisDAy();
  List<Prayer2> prayerForNextDay = await getPrayerForNextDay();
  String body;
  if (name == "Fajr") {
    if (await nowIsAfterPrayer("Fajr")) {
      body =
          "It's time of prayer now : ${prayerForNextDay[0].hour}:${prayerForNextDay[0].minute} 🕌";
    } else {
      body =
          "It's time of prayer now : ${prayerForThisDAy[0].hour}:${prayerForThisDAy[0].minute} 🕌";
    }
  } else if (name == "Duhr") {
    if (await nowIsAfterPrayer("Duhr")) {
      body =
          "It's time of prayer now : ${prayerForNextDay[1].hour}:${prayerForNextDay[1].minute} 🕌";
    } else {
      body =
          "It's time of prayer now : ${prayerForThisDAy[1].hour}:${prayerForThisDAy[1].minute} 🕌";
    }
  } else if (name == "Asr") {
    if (await nowIsAfterPrayer("Asr")) {
      body =
          "It's time of prayer now : ${prayerForNextDay[2].hour}:${prayerForNextDay[2].minute} 🕌";
    } else {
      body =
          "It's time of prayer now : ${prayerForThisDAy[2].hour}:${prayerForThisDAy[2].minute} 🕌";
    }
  } else if (name == "Maghreb") {
    if (await nowIsAfterPrayer("Maghreb")) {
      body =
          "It's time of prayer now : ${prayerForNextDay[3].hour}:${prayerForNextDay[3].minute} 🕌";
    } else {
      body =
          "It's time of prayer now : ${prayerForThisDAy[3].hour}:${prayerForThisDAy[3].minute} 🕌";
    }
  } else {
    if (await nowIsAfterPrayer("Isha")) {
      body =
          "It's time of prayer now : ${prayerForNextDay[4].hour}:${prayerForNextDay[4].minute} 🕌";
    } else {
      body =
          "It's time of prayer now : ${prayerForThisDAy[4].hour}:${prayerForThisDAy[4].minute} 🕌";
    }
  }
  return body;
}

//-------------------------This Function Return Alarm Date For Prayer-------------------------//

Future<DateTime> selectAlarmDateTime(String prayer) async {
  List<Prayer2> prayerForThisDAy = await getPrayerForThisDAy();
  // Will get Date For Prayer For This Day
  List<Prayer2> prayerForNextDay = await getPrayerForNextDay();
  // Will get Date For Prayer For Next Day
  DateTime date;
  if (prayer == "Fajr") {
    if (await nowIsAfterPrayer("Fajr")) {
      date = prayerForNextDay[0].dateTime;
    } else {
      date = prayerForThisDAy[0].dateTime;
    }
  } else if (prayer == "Duhr") {
    if (await nowIsAfterPrayer("Duhr")) {
      date = prayerForNextDay[1].dateTime;
    } else {
      date = prayerForThisDAy[1].dateTime;
    }
  } else if (prayer == "Asr") {
    if (await nowIsAfterPrayer("Asr")) {
      date = prayerForNextDay[2].dateTime;
    } else {
      date = prayerForThisDAy[2].dateTime;
    }
  } else if (prayer == "Maghreb") {
    if (await nowIsAfterPrayer("Maghreb")) {
      date = prayerForNextDay[3].dateTime;
    } else {
      date = prayerForThisDAy[3].dateTime;
    }
  } else {
    if (await nowIsAfterPrayer("Isha")) {
      date = prayerForNextDay[4].dateTime;
    } else {
      date = prayerForThisDAy[4].dateTime;
    }
  }

  return date;
}

//----------------------------End Alarm Date For Prayer----------------------------//

Future scheduleAlarm(int id, String title, String body, String prayer) async {
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));
  print(tz.local);
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('solidarieta_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {});
  var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
  });

  DateTime scheduledNotificationDateTime = await selectAlarmDateTime(prayer);
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_notif', 'alarm_notif',
      icon: 'solidarieta_logo',
      // playSound: true,
      // sound: RawResourceAndroidNotificationSound('a_long_cold_sting.wav'),
      largeIcon: DrawableResourceAndroidBitmap('solidarieta_logo'),
      importance: Importance.max);

  var iOSPlatformChannelSpecifics = const IOSNotificationDetails(
      // sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.zonedSchedule(
    id,
    title,
    body,
    tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
  );
}
