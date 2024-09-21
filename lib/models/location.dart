import 'package:cloud_firestore/cloud_firestore.dart';

class Location {
  final String id;
  final String name;
  final double price;
  final GeoPoint geopoint;

  Location({
    required this.id,
    required this.name,
    required this.price,
    required this.geopoint,
  });

  factory Location.fromFirestore(Map<String, dynamic> data, String id) {
    return Location(
      id: id,
      name: data['name'] ?? '',
      price: data['price']?.toDouble() ?? 0.0,
      geopoint: data['geopoint'] ?? GeoPoint(0, 0),
    );
  }
}