import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import necessário para o GeoPoint

class LocalizacaoInfo extends StatefulWidget {
  final GeoPoint location; // Recebe o GeoPoint da localização

  const LocalizacaoInfo({super.key, required this.location});

  @override
  State<LocalizacaoInfo> createState() => _LocalizacaoInfoState();
}

class _LocalizacaoInfoState extends State<LocalizacaoInfo> {
  GoogleMapController? mapController;

  late LatLng _target;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    
    // Define o centro do mapa como a posição da locação
    _target = LatLng(widget.location.latitude, widget.location.longitude);

    // Adiciona um marcador na posição da locação
    _addMarker();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker_location'),
          position: _target,
          infoWindow: const InfoWindow(
            title: 'Localização da locação',
            snippet: 'Endereço ou descrição aqui',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Localização no Mapa',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _target,
          zoom: 14.0,  // Ajuste o zoom conforme necessário
        ),
        markers: _markers,
      ),
    );
  }
}
