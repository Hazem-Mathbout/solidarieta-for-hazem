// class MapDirection extends StatelessWidget {

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:location/location.dart';

import 'dart:math' show cos, sqrt, asin;

import 'package:provider/provider.dart';
import 'package:solidarieta/src/core/providers/mapProvider.dart';
import 'package:solidarieta/src/helpers/constants/moschee.dart';

class MapDirection extends StatefulWidget {
  @override
  _MapDirectionState createState() => _MapDirectionState();
}

class _MapDirectionState extends State<MapDirection> {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(0.0, 0.0), zoom: 6);

  final Location location = Location();

  LocationData _location;
  String _error;
  LatLng _originLoc = LatLng(0, 0);
  LatLng _destinationLoc =
      LatLng(45.515439986189016, 9.145578169004908); // Of Quarto Oggiaro

  Future<void> animateTo(double lat, double lng, double zoom) async {
    final c = await _controller.future;
    final p = CameraPosition(
      target: LatLng(lat, lng),
      zoom: zoom,
    );
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  Future<void> _getLocation() async {
    setState(() {
      _error = null;
    });
    try {
      final LocationData _locationResult = await location.getLocation();
      setState(() {
        _location = _locationResult;

        _originLoc = LatLng(_location.latitude, _location.longitude);
        Moschea _nearestMosque = nearestMosque(moschee, _originLoc);
        _destinationLoc = _nearestMosque.latLng;

        double distance = _coordinateDistance(_destinationLoc, _originLoc);

        animateTo(
          _location.latitude,
          _location.longitude,
          _getTheZoom(distance),
        );

        /// add origin marker origin marker
        _addMarker(
          _originLoc,
          "origin",
          BitmapDescriptor.defaultMarker,
        );

        // Add destination marker

        _addMarker(
          _nearestMosque.latLng,
          "destination",
          BitmapDescriptor.defaultMarkerWithHue(90),
          // BitmapDescriptor.fromAssetImage(),
        );

        _getPolyline();
      });
    } on PlatformException catch (err) {
      setState(() {
        _error = err.code;
      });
    }
  }

// Markers to show points on the map
  Map<MarkerId, Marker> markers = {};
  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  IconData _chosenValue = Icons.directions_car;
  IconData _chosenValueTwo = LineAwesomeIcons.alternate_map_marked;

  @override
  Widget build(BuildContext context) {
    var mapType = Provider.of<MapProvider>(context, listen: false);
    Moschea currentMosque =
        Provider.of<MapProvider>(context, listen: false).getCurrentMosque();
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: mapType.getCurrentMapType(),
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            polylines: Set<Polyline>.of(polylines.values),
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
            left: 30, // 18
            top: 40,
            child: Column(
              children: [
                InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<IconData>(
                          autofocus: true,
                          value: _chosenValue,
                          iconSize: 0.0,
                          style: TextStyle(color: Colors.black),
                          items: <IconData>[
                            Icons.directions_car,
                            Icons.directions_walk_outlined,
                          ].map<DropdownMenuItem<IconData>>((IconData value) {
                            return DropdownMenuItem<IconData>(
                              value: value,
                              child: Icon(
                                value,
                                color: Colors.grey[700],
                              ),
                            );
                          }).toList(),
                          onChanged: (IconData value) {
                            var travel = Provider.of<MapProvider>(context,
                                listen: false);
                            setState(() {
                              if (value == Icons.directions_car) {
                                travel.updateTravelMode(TravelMode.driving);
                              } else if (value ==
                                  Icons.directions_walk_outlined) {
                                travel.updateTravelMode(TravelMode.walking);
                              }

                              _getLocation();
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<IconData>(
                          autofocus: true,
                          value: _chosenValueTwo,
                          iconSize: 0.0,
                          style: TextStyle(color: Colors.black),
                          items: <IconData>[
                            LineAwesomeIcons.alternate_map_marked,
                            Icons.map,
                          ].map<DropdownMenuItem<IconData>>((IconData value) {
                            return DropdownMenuItem<IconData>(
                              value: value,
                              child: Icon(
                                value,
                                color: Colors.grey[700],
                              ),
                            );
                          }).toList(),
                          onChanged: (IconData value) {
                            var travel = Provider.of<MapProvider>(context,
                                listen: false);
                            setState(() {
                              if (value ==
                                  LineAwesomeIcons.alternate_map_marked) {
                                travel.updateMapType(MapType.normal);
                              } else if (value == Icons.map) {
                                travel.updateMapType(MapType.satellite);
                              }

                              _getLocation();
                              _chosenValueTwo = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      _getLocation();
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.autorenew,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 40,
            child: InkWell(
              child: Container(
                width: 240,
                margin: EdgeInsets.only(right: 60.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "La moschea più vicina :",
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentMosque.title,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        currentMosque.direction,
                        style: TextStyle(
                          // color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// get the map zoom depends on distance
  double _getTheZoom(double distance) {
    if (distance < 1) {
      return 16;
    } else if (distance < 2) {
      return 15;
    } else if (distance < 5) {
      return 14;
    } else
      return 13;
  }

// add a Marker
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

// add polyline
  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      color: Colors.red,
      polylineId: id,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
    setState(() {});
  }

// get the polylines
  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    var travel = Provider.of<MapProvider>(context, listen: false);
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCSTlgS5zNyXm7NYe64j6lyif5Wmvq6acY",
      PointLatLng(_originLoc.latitude, _originLoc.longitude),
      PointLatLng(_destinationLoc.latitude, _destinationLoc.longitude),
      travelMode: travel.getCurrentTravelMode(),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

// Distance between two locations
  double _coordinateDistance(LatLng origin, LatLng dest) {
    var lat1 = origin.latitude;
    var lat2 = dest.latitude;
    var lon1 = origin.longitude;
    var lon2 = dest.longitude;

    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

// The nearest mosque to the current location
  Moschea nearestMosque(List<Moschea> mosques, LatLng currentLocation) {
    var moschea = Provider.of<MapProvider>(context, listen: false);
    double distance = _coordinateDistance(mosques[0].latLng, currentLocation);
    Moschea nearest = mosques[0];
    for (var i = 0; i < mosques.length; i++) {
      double theDis = _coordinateDistance(mosques[i].latLng, currentLocation);

      if (theDis < distance) {
        distance = theDis;
        nearest = mosques[i];
      }
    }
    moschea.updateCurrentMosque(nearest);
    return nearest;
  }
}
