import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/providers/bottom_navbar_index.dart';
import 'package:solidarieta/src/core/providers/times_provider.dart';

import 'src/core/screens/fixed_screens/splash_screen.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => BottomNavbarIndex()),
        ChangeNotifierProvider(create: (context) => Times()),
      ], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          "Applicazione dell'Associazione di solidarietà - Milano, Quarto Oggiaro",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 133, 119, 1),
        accentColor: Color.fromRGBO(122, 88, 49, 1),
      ),
      home: SplashScreen(),
    );
  }
}
