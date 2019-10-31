import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var markers = <MarkerId, Marker>{};
  Size screenSize;
  //Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _controller;

  CameraPosition _position = CameraPosition(
    target: LatLng(10.45, -73.25),
    zoom: 13.0
  );

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).copyWith().size;
    return SafeArea(
      child: Scaffold(
          body: Stack(children:<Widget>[
            _buildFlutterMap(),
            Column(
              children: <Widget>[
                Expanded(child: Container()),
                _buildCooperativeList(context),
              ],
            )
          ])
      ),
    );
  }
  
  _changeMapMode(){
    getMapJsonFile("assets/dark_map.json").then(setMapStyle);
  }

  Future<String> getMapJsonFile(String path) async{
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle){
    _controller.setMapStyle(mapStyle);
  }

  Widget _buildFlutterMap() {
    _addMarker();
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _position,
          markers: Set<Marker>.of(markers.values),
          onMapCreated: (GoogleMapController controller){
            _controller = controller;
            _changeMapMode();
            //_controller.complete(controller);
          },
        )
    );
  }

  void _addMarker(){
    final MarkerId markerId = MarkerId('1235');

    final Marker marker = Marker(
      markerId: markerId,
      icon: BitmapDescriptor.defaultMarker,
      onTap: (){
        print(markers[markerId].position);
      },
      position: LatLng(
        10.45,
        -73.25
      )
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  Widget _buildCooperativeList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      height: screenSize.height*0.4,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                ),
              ]
            ),
            child: ListTile(
              leading: Hero(tag: 'CooperativePresentation', child: Image.asset('assets/cootracesar_logo.jpg', fit: BoxFit.cover,)),
              title: Text('Cootracesar'),
              subtitle: Text('Cooperativa de transporte del cesar'),
              onTap: (){
                Navigator.pushNamed(context, 'cooperative');
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
