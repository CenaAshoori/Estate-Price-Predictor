import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'map_widget.dart';

List<LatLng> latLngList = [
  LatLng(37.3081, 49.5835),
  LatLng(37.3079, 49.5922),
  LatLng(37.3059, 49.5873),
  LatLng(37.30557, 49.59367),
  LatLng(37.30182, 49.58883),
  LatLng(37.3047, 49.59421),
  LatLng(37.29846, 49.58359),
  LatLng(37.2988, 49.59524),
  LatLng(37.30129, 49.60495),
  LatLng(37.28314, 49.60396),
  LatLng(37.27781, 49.58012),
  LatLng(37.2674, 49.5827),
  LatLng(37.2853, 49.5816),
  LatLng(37.2951, 49.5754),
  LatLng(37.26221, 49.59569),
  LatLng(37.2426, 49.5931),
  LatLng(37.2589, 49.6054),
  LatLng(30.410188, 55.996264),
  LatLng(30.401363, 56.008551),
  LatLng(30.401241, 55.989427),
  LatLng(30.398478, 55.992394),
  LatLng(30.387848, 56.004204),
  LatLng(30.405969, 55.981346),
  LatLng(30.402577, 55.974818),
  LatLng(30.398045, 55.968849),
  LatLng(30.385586, 55.983764),
  LatLng(31.876131, 54.309136),
  LatLng(31.851603, 54.330118),
  LatLng(31.837855, 54.373444),
  LatLng(31.873321, 54.345942),
  LatLng(31.859499, 54.401721),
  LatLng(31.922585, 54.321813),
  LatLng(31.867213, 54.363161),
  LatLng(31.919735, 54.349501),
  LatLng(31.90127, 54.383401),
];

class ShowMap extends StatefulWidget {
  @override
  _ShowMapState createState() => _ShowMapState();
}

class _ShowMapState extends State<ShowMap> {
  @override
  Widget build(BuildContext context) {
    List<Marker> _markers = latLngList
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
      // drawer: Drawer(
      //   child: MapWidget(latLngList: _latLngList, markers: _markers),
      // ),
      appBar: AppBar(title: Text("Map")),
      body: Container(
        child: MapWidget(latLngList: latLngList, markers: _markers),
      ),
    );
  }
}
