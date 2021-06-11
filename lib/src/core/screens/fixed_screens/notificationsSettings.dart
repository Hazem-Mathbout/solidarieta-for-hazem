import 'package:flutter/material.dart';

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("NOTIFICHE"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("permissionStatus :  ")],
        ),
      ),
    );
  }
}
