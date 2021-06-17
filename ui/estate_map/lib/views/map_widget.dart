import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key key,
    @required List<LatLng> latLngList,
    @required List<Marker> markers,
  })  : _latLngList = latLngList,
        _markers = markers,
        super(key: key);

  final List<LatLng> _latLngList;
  final List<Marker> _markers;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: MapController(),
        options: MapOptions(
          center: _latLngList[0],
          bounds: LatLngBounds.fromPoints(_latLngList),
          plugins: [
            MarkerClusterPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
            minZoom: 1,
            maxZoom: 18,
            backgroundColor: Colors.black,
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 190,
            disableClusteringAtZoom: 16,
            size: Size(50, 50),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: _markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.black12,
                borderStrokeWidth: 3),
            builder: (context, markers) {
              return Container(
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                child: Text('${markers.length}'),
              );
            },
          ),
        ]);
  }
}
