import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Map extends StatefulWidget {
  const Map({super.key});

  final String testString = '모달';

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  double x = 36.766453;
  double y = 127.281656; // 2공학관 촤표
  final MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(x, y),
                  initialZoom: 18,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.detection.app',
                  ),
                  const RichAttributionWidget(
                    attributions: [
                      TextSourceAttribution(
                        'OpenStreetMap contributors',
                      ),
                    ],
                  ),
                  MarkerLayer(markers: [
                    Marker(
                        point: LatLng(x, y),
                        child: const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ))
                  ])
                ],
              )),
        ],
      )
    );
  }
}
