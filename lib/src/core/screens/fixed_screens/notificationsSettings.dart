import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:solidarieta/main.dart';
import 'package:solidarieta/src/core/models/hazem/notification_service.dart';
import 'package:solidarieta/src/core/models/hazem/prayerModel.dart';
import 'package:solidarieta/src/core/providers/notificationsProvider.dart';

class NotificationsSettings extends StatefulWidget {
  const NotificationsSettings({Key key}) : super(key: key);

  @override
  _NotificationsSettingsState createState() => _NotificationsSettingsState();
}

class _NotificationsSettingsState extends State<NotificationsSettings> {
  List<String> pyr = ["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha'a"];

  //   ---------------------------------------
  PermissionStatus status;
  bool isLoading = false;
  String notState = "nothing";

  checkNotificationsPermession() async {
    status = await Permission.notification.status;
    if (status.isGranted) {
      setState(() {
        notState = "granted";
        isLoading = true;
      });
    } else if (!status.isGranted) {
      setState(() {
        notState = "denied";
        isLoading = true;
      });
    }
  }

  @override
  void initState() {
    Permission.notification.request();
    checkNotificationsPermession();
    super.initState();
  }
  //   ---------------------------------------

  @override
  Widget build(BuildContext context) {
    List<Prayer> prayers = getPrayers();
    var notifications =
        Provider.of<NotificationsProvider>(context, listen: false);
    if (notState == "granted") {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Notifiche",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  "Scegli le preghiere che vuoi essere avvisato",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: notifications.getNotifications().length,
                  itemBuilder: (context, index) {
                    Prayer pr = prayers[index];
                    List<bool> list = notifications.getNotifications();
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          topLeft: index == 0
                              ? Radius.circular(20)
                              : Radius.circular(0),
                          topRight: index == 0
                              ? Radius.circular(20)
                              : Radius.circular(0),
                          bottomLeft: index == 4
                              ? Radius.circular(20)
                              : Radius.circular(0),
                          bottomRight: index == 4
                              ? Radius.circular(20)
                              : Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pyr[index],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: FlutterSwitch(
                                    activeColor: Theme.of(context).primaryColor,
                                    width: 70.0,
                                    height: 30.0,
                                    valueFontSize: 15.0,
                                    toggleSize: 15.0,
                                    value: list[index],
                                    padding: 8.0,
                                    showOnOff: true,
                                    onToggle: (value) async {
                                      setState(() {
                                        notifications
                                            .updateNotifications(index);
                                      });
                                      await onToggleUser(list, index, pr);
                                    },
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  list[index]
                                      ? LineAwesomeIcons.bell
                                      : LineAwesomeIcons.bell_slash,
                                  size: 30,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            "Notifiche",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Wrap(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(250, 225, 221, 1),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.red)),
              child: Column(
                children: [
                  Text(
                    "Le notifiche non sono state precedentemente approvate",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Le notifiche devono essere attivate manualmente nelle impostazioni del telefono, poi premere Aggiorna",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    child: Text('Aggiorna'),
                    onPressed: () {
                      checkNotificationsPermession();
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  Future<void> onToggleUser(List<bool> list, int index, Prayer pr) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String getKeyForPrayer = index.toString();
    int notificationID = prefs.getInt(getKeyForPrayer);

    if (list[index] == true) {
      await flutterLocalNotificationsPlugin.cancel(notificationID);
    }
    if (list[index] == false) {
      await scheduleAlarm(notificationID, getTitlePrayer(pr.name),
          getBodyPrayer(pr.name), pr.name);
    }
  }
}
