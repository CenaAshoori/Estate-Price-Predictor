import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'map_widget.dart';

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  @override
  Widget build(BuildContext context) {
    List<LatLng> _latLngList = [
      LatLng(37.298096, 49.591037),
      LatLng(37.30734542, 49.59219843),
      LatLng(37.29972627, 49.60154127),
      LatLng(37.29391878, 49.59034453),
      LatLng(37.29053384, 49.59366519),
      LatLng(37.29438, 49.59809),
      LatLng(37.29029, 49.59855),
      LatLng(37.29212, 49.58837),
    ];
    List<Marker> _markers = _latLngList
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.house,
                size: 60,
                color: Colors.blueAccent,
              ),
            ))
        .toList();

    return Scaffold(
      drawer: Drawer(
        child: MapWidget(latLngList: _latLngList, markers: _markers),
      ),
      appBar: AppBar(title: Text("Map")),
      body: Container(
        child: MapWidget(latLngList: _latLngList, markers: _markers),
      ),
    );
  }
}
