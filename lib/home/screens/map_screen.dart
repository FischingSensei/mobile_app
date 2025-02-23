import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlutterMap(
        children: <Widget>[
          TileLayer( // Bring your own tiles
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
            userAgentPackageName: 'com.example.app', // Add your app identifier
            // And many more recommended properties!
          ),
        ]
      ),
    );
  }
}