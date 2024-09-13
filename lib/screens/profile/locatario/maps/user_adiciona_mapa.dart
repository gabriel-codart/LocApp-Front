import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserAdicionaMapa extends StatefulWidget {
  const UserAdicionaMapa({super.key});

  @override
  State<UserAdicionaMapa> createState() => _UserAdicionaMapaState();
}

class _UserAdicionaMapaState extends State<UserAdicionaMapa> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(-5.0887985, -42.81359);
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers();
  }

  void _addMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('marker_1'),
          position: LatLng(-5.0696901, -42.7754298),
          infoWindow: const InfoWindow(
            title: 'Condomínio Solaris',
            snippet: 'Edifício localizado no condomínio solaris 2',
          ),
        ),
      );
    });
  }

  // Método para adicionar um marcador quando o mapa for tocado
  void _addMarkerOnTap(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: const InfoWindow(
            title: 'Nova Localização',
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Maps',
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.5,
        ),
        markers: _markers,
        onTap: _addMarkerOnTap, // Detecta o toque no mapa
      ),
    );
  }
}
