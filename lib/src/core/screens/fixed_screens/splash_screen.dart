import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:solidarieta/home.dart';
import 'package:solidarieta/src/core/screens/fixed_screens/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var isSeen = Hive.box('onboarding');
    // bool seen = isSeen.get("seen");

    if (isSeen.get("seen") == null) isSeen.put("seen", false);

    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  if (isSeen.get("seen")) {
                    return HomeScreen();
                  } else {
                    isSeen.put("seen", true);
                    return OnBoardingPage();
                  }
                },
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
                fit: BoxFit.cover, repeat: ImageRepeat.noRepeat, width: 200.0),
          ],
        ),
      ),
    );
  }
}
