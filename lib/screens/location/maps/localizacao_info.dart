import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:locapp/models/location.dart';

class LocalizacaoInfo extends StatefulWidget {
  final Location location; // Recebe o GeoPoint da localização

  const LocalizacaoInfo({super.key, required this.location});

  @override
  State<LocalizacaoInfo> createState() => _LocalizacaoInfoState();
}

class _LocalizacaoInfoState extends State<LocalizacaoInfo> {
  GoogleMapController? mapController;

  late String title;
  late String description;
  late String price;
  late LatLng _target;
  LatLng? _userLocation;
  String _distanceText = '';
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    
    // Nome e descrição da locação
    title = widget.location.name;
    description = 'Descrição breve sobre o local de locação'; // Se quiser customizar depois
    price = 'R\$${widget.location.price.toString()} p/ Horário';

    // Define o centro do mapa como a posição da locação
    _target = LatLng(widget.location.geopoint.latitude, widget.location.geopoint.longitude);

    // Adiciona o marcador da locação
    _addLocationMarker();

    // Obter a localização atual do usuário e adicionar um marcador
    _getUserLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addLocationMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker_location'),
          position: _target,
          infoWindow: InfoWindow(
            title: title,
            snippet: 'Distância: $_distanceText',
          ),
        ),
      );
    });
  }

  Future<void> _getUserLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Verificar se o serviço de localização está habilitado
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Serviço de localização desativado.');
    }

    // Verificar permissão de localização
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Permissão de localização permanentemente negada.');
    }

    // Obter a posição atual
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
      _addUserMarker();
      _calculateDistance();
    });
  }

  void _addUserMarker() {
    if (_userLocation != null) {
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId('marker_user'),
            position: _userLocation!,
            infoWindow: const InfoWindow(
              title: 'Sua localização',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );
      });
    }
  }

  void _calculateDistance() {
    if (_userLocation != null) {
      final distance = Geolocator.distanceBetween(
        _userLocation!.latitude,
        _userLocation!.longitude,
        _target.latitude,
        _target.longitude,
      );

      // Converter para km se a distância for maior que 1km, senão em metros
      setState(() {
        if (distance > 1000) {
          _distanceText = '${(distance / 1000).toStringAsFixed(2)} km';
        } else {
          _distanceText = '${distance.toStringAsFixed(0)} metros';
        }

        // Atualiza o marcador da locação com a distância
        _markers.removeWhere((marker) => marker.markerId == const MarkerId('marker_location'));
        _addLocationMarker();
      });
    }
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
