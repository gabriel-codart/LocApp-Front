import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:locapp/models/location.dart';

import 'package:locapp/screens/location/location-details.dart';
import 'package:locapp/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<String> categories = [
    'Recomendado',
    'Longa duração',
    'Curta duração',
    'Eventos',
  ];

  Future<List<Location>> getLocations() async {
    try {
      var snapshot = await firestore.collection('location').get();
      return snapshot.docs.map((doc) {
        var mapData = doc.data();
        mapData['id'] = doc.id;
        return Location.fromFirestore(mapData, doc.id);
      }).toList();
    } on FirebaseException catch (e) {
      debugPrint("Failed with error '${e.code}': ${e.message}");
      throw Exception(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Campo de busca
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black54.withOpacity(0.6)),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisar por locação',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.mic, color: Colors.black54.withOpacity(0.6)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Categorias
            Text(
              "Categorias",
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories.map((category) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor:
                          Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      child: Icon(Icons.category, size: 24, color: Colors.grey),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Populares
            Text(
              "Populares",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 10),

            // Listagem de Locações
            Expanded(
              child: FutureBuilder<List<Location>>(
                future: getLocations(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Erro ao carregar locações'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhuma locação disponível'));
                  }

                  var locations = snapshot.data!;
                  return ListView.builder(
                    itemCount: locations.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      Location location = locations[index]; 

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LocationDetails(location: location),
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.r5jzGByVNVqcIi7q0n09kAHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                                  height: 175,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      location.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    RatingBarIndicator(
                                      rating: 4.0,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Theme.of(context).colorScheme.secondary,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      "R\$${location.price.toStringAsFixed(2)} / Hora",
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}