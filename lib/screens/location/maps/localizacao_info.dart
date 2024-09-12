import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizacaoInfo extends StatefulWidget {
  const LocalizacaoInfo({super.key});

  @override
  State<LocalizacaoInfo> createState() => _LocalizacaoInfoState();
}

class _LocalizacaoInfoState extends State<LocalizacaoInfo> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(-5.0887985, -42.81359);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller){
    mapController = controller;
    _addMarkers();
  }

  void _addMarkers(){
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker_1'),
          position: LatLng(-5.0696901, -42.7754298),
          infoWindow: InfoWindow(
            title: 'Condomínio Solaris',
            snippet: 'Edifício localizado no condomínio solaris 2',
          ),
          ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Maps', style: TextStyle(
          color: Colors.black54,
        ),)),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.5,
        ),
        markers: _markers,
      ),
    );
  }
}