import 'package:flutter/material.dart';

import 'package:hive/hive.dart';

class PrayerSettingsProvider extends ChangeNotifier {
  var settings = Hive.box('prayers');

  int calculationMethod = 0;
  int madhab = 0;
  double lat = 45.533333;
  double long = 9.133333;
  String locationDesciption = "Novate Milanese, Milan 20026, Lombardy Italy";
  getCurrentLocationDescription() {
    if (settings.get('location_description') == null) {
      settings.put('location_description', locationDesciption);
      return locationDesciption;
    } else {
      return settings.get('location_description');
    }
  }

  getCurrentCalculationMethod() {
    if (settings.get('calculationMethod') == null) {
      settings.put('calculationMethod', calculationMethod);
      return calculationMethod;
    } else {
      return settings.get('calculationMethod');
    }
  }

  getCurrentMadhab() {
    if (settings.get('madhab') == null) {
      settings.put('madhab', madhab);
      return madhab;
    } else {
      return settings.get('madhab');
    }
  }

  getCurrentLat() {
    if (settings.get('latitude') == null) {
      settings.put('latitude', lat);
      return lat;
    } else {
      return settings.get('latitude');
    }
  }

  getCurrentLong() {
    if (settings.get('longitude') == null) {
      settings.put('longitude', long);
      return long;
    } else {
      return settings.get('longitude');
    }
  }

  updateLocationDesciption(String text) {
    settings.put('location_description', text);
    notifyListeners();
  }

  updateCalculationMethod(int index) {
    settings.put('calculationMethod', index);
    notifyListeners();
  }

  updateMadhab(int index) {
    settings.put('madhab', index);
    notifyListeners();
  }

  updateLat(double newLat) {
    settings.put('latitude', newLat);
    notifyListeners();
  }

  updateLong(double newLong) {
    settings.put('longitude', newLong);
    notifyListeners();
  }
}
