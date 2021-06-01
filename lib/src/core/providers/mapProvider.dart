import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solidarieta/src/helpers/constants/moschee.dart';

class MapProvider extends ChangeNotifier {
  MapType _currentMapType = MapType.normal;
  TravelMode _currentTravelMode = TravelMode.driving;
  Moschea _currentMosque = Moschea(
      id: 21,
      title: "Moschea di Quarto Oggiaro",
      direction: "Via Sabatino Lopez, 3, 20157 Quarto Oggiaro",
      latLng: LatLng(45.515439986189016, 9.145578169004908));

  getCurrentMapType() => _currentMapType;
  getCurrentTravelMode() => _currentTravelMode;
  getCurrentMosque() => _currentMosque;

  updateMapType(MapType newMapType) {
    _currentMapType = newMapType;
    notifyListeners();
  }

  updateTravelMode(TravelMode newTravelMode) {
    _currentTravelMode = newTravelMode;
    notifyListeners();
  }

  updateCurrentMosque(Moschea newMoschea) {
    _currentMosque = newMoschea;
    notifyListeners();
  }
}
