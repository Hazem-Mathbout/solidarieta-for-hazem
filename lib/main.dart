import 'package:flutter/material.dart';

import 'src/core/screens/fixed/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:
          "Applicazione dell'Associazione di solidarietà - Milano, Quarto Oggiaro",
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 133, 119, 1),
        accentColor: Color.fromRGBO(122, 88, 49, 1),
      ),
      home: SplashScreen(),
    );
  }
}
