import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:solidarieta/home.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key key}) : super(key: key);
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final Location location = Location();

// the page where we go after the screens
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

// image creating
  Widget _buildImage(String assetName) {
    return Align(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        height: 200.0,
        child: Image.asset('assets/images/onboarding/$assetName.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titlePadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 30.0),
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      bodyTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
      footerPadding: EdgeInsets.fromLTRB(45.0, 10.0, 45.0, 20.0),
      imagePadding: EdgeInsets.only(top: 30.0),
      boxDecoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
    );

    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      key: introKey,
      // Pages
      pages: [
        PageViewModel(
          title: "Benvenuto",
          body:
              "Grazie per aver installato l'applicazione dell'associazione, avremo bisogno di alcune autorizzazioni per garantire la funzionalità ottimale.",
          image: _buildImage('onboar_fir'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Posizione",
          body:
              "Per fornire tempi di preghiera precisi, l'app deve conoscere la tua posizione.",
          image: _buildImage('onboar_sec'),
          decoration: pageDecoration,
          footer: InkWell(
            onTap: () async {
              // ignore: unused_local_variable
              final LocationData _locationResult = await location.getLocation();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: const Center(
                  child: Text(
                    'CONSENTI LA POSIZIONE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        PageViewModel(
          title: "Notifiche",
          body: "Dobbiamo abilitare le notifiche per i promemoria del Adhan.",
          image: _buildImage('onboar_thi'),
          decoration: pageDecoration,
          footer: InkWell(
            onTap: () {
              // ignore: unused_local_variable
              // Future permissionStatus =
              //     NotificationPermissions.requestNotificationPermissions();
              Permission.notification.request();
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
                child: const Center(
                  child: Text(
                    'CONSENTI LE NOTIFICHE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],

      // Skip
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      skip: const Text('SALTA'),
      showSkipButton: false,
      skipFlex: 0,
      nextFlex: 0,

      // Next
      next: const Text('AVANTI'), // const Icon(Icons.arrow_forward),

      //Done
      onDone: () => _onIntroEnd(context),
      done: const Text('FINITO', style: TextStyle(fontWeight: FontWeight.w600)),

      // The center Dots decoration
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(35.0, 10.0),
        activeColor: Color.fromRGBO(0, 133, 119, 1),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
