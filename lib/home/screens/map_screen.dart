import 'package:fishing_sensei/home/screens/service/geolocator/map_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position _userPosition = Position(
      longitude: -1,
      latitude: -1,
      timestamp: DateTime(DateTime.april),
      accuracy: 0,
      altitude: 0,
      altitudeAccuracy: 0,
      heading: 0,
      headingAccuracy: 0,
      speed: 1,
      speedAccuracy: 1);

  @override
  void initState() {
    super.initState();
    askAuthorizationAndSetUserPosition();
  }

  void askAuthorizationAndSetUserPosition() async {
    if (await Geolocator.isLocationServiceEnabled()) {
      Position userPosition = await MapService.getUserLocation();

      setState(() {
        _userPosition = userPosition;
      });
    } else {
      await Geolocator.openLocationSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return _userPosition.latitude != -1
        ? FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(_userPosition.latitude, _userPosition.longitude),
            ),
            children: <Widget>[
                TileLayer(
                  // Bring your own tiles
                  urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
                  userAgentPackageName:
                      'com.example.app', // Add your app identifier
                  // And many more recommended properties!
                ),
              ])
        : Center(
            child: CircularProgressIndicator(
            color: Colors.red,
          ));
  }
}
