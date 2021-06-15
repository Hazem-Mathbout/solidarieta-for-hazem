import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:solidarieta/src/core/providers/bottom_navbar_index.dart';
import 'package:solidarieta/src/core/providers/mapProvider.dart';
import 'package:solidarieta/src/core/providers/notificationsProvider.dart';
import 'package:solidarieta/src/core/providers/times_provider.dart';
import 'package:solidarieta/src/core/screens/fixed_screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // -------------- Hive ------------------- Start
  Directory appDocDir = await getApplicationDocumentsDirectory();
  String appDocPath = appDocDir.path;
  await Hive.initFlutter(appDocPath);
  await Hive.openBox('onboarding');
  await Hive.openBox('notifications');
  // -------------- Hive ------------------- End
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => BottomNavbarIndex()),
      ChangeNotifierProvider(create: (context) => Times()),
      ChangeNotifierProvider(create: (context) => NotificationsProvider()),
      ChangeNotifierProvider(create: (context) => MapProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          "Applicazione dell'Associazione di solidarietà - Milano, Quarto Oggiaro",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 133, 119, 1),
      ),
      home: SplashScreen(),
    );
  }
}

// Access to dashboard ( https://app.flycricket.com/ )  email: id22boubker@gmail.com - pass: soso980
// Privacy Policy : https://associazione-la-soli.flycricket.io/privacy.html
// Terms of service : https://associazione-la-soli.flycricket.io/terms.html

// access : id22boubker@gmail.com - soso8989@
// http://lasolidarieta.rf.gd/termsandconditions.html?i=1
// http://lasolidarieta.rf.gd/privacypolicy.html
