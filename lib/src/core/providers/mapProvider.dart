import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapProvider extends ChangeNotifier {
  MapType _currentMapType = MapType.normal;
  TravelMode _currentTravelMode = TravelMode.driving;

  getCurrentMapType() => _currentMapType;
  getCurrentTravelMode() => _currentTravelMode;

  updateMapType(MapType newMapType) {
    _currentMapType = newMapType;
    notifyListeners();
  }

  updateTravelMode(TravelMode newTravelMode) {
    _currentTravelMode = newTravelMode;
    notifyListeners();
  }
}
