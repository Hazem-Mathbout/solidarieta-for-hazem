import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:solidarieta/src/core/components/qibla_files/loading_indicator.dart';
import 'package:solidarieta/src/core/components/qibla_files/qiblah_compass.dart';
import 'package:solidarieta/src/core/components/qibla_files/qiblah_maps.dart';

class Qibla extends StatefulWidget {
  @override
  _QiblaState createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  final _deviceSupport = FlutterQiblah.androidDeviceSensorSupport();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _deviceSupport,
        builder: (_, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingIndicator();
          if (snapshot.hasError)
            return Center(
              child: Text("Error: ${snapshot.error.toString()}"),
            );

          if (snapshot.data)
            return QiblahCompass();
          else
            return QiblahMaps();
        },
      ),
    );
  }
}
