import 'package:flutter/material.dart';
import 'package:luci_driver/main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:luci_driver/utils/http.dart';

class OrderMap extends StatelessWidget {
  static String tag = 'order-map';
  final List addlist;
  
  OrderMap({Key key, @required this.addlist}):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Maps',
      home: MapSample(addlist: addlist,));
  }
}

class MapSample extends StatefulWidget {
  final List addlist; 
  MapSample({Key key,this.addlist}):super(key: key);
   
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static  CameraPosition _kGooglePlex(double lnt, double lng) = CameraPosition(
    // target: LatLng(37.42796133580664, -122.085749655962),
    
    target: LatLng(lnt,lng),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}