import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:flutter/material.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  final fba.User? user = fba.FirebaseAuth.instance.currentUser;

  Future<String> _getLocationName(String locationId) async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection('location')
          .doc(locationId)
          .get();
      if (doc.exists) {
        return doc['name'];
      } else {
        return 'Local não encontrado';
      }
    } catch (e) {
      print('Erro ao buscar o nome do local: $e');
      return 'Erro';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('reservation') // Coleção de reservas
            .where('customer', isEqualTo: user!.email) // Filtrar pelo ID do usuário
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar as reservas'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('Nenhuma reserva encontrada'));
          }

          final reservations = snapshot.data!.docs;

          return ListView.separated(
            itemCount: reservations.length,
            separatorBuilder: (context, index) => const Divider(height: 1, thickness: 1, color: Colors.black54),
            itemBuilder: (context, index) {
              final reservation = reservations[index];
              final locationId = reservation['location'];
              final date = reservation['date'];
              final time = reservation['time'];
              final price = reservation['price'];

              return FutureBuilder<String>(
                future: _getLocationName(locationId),
                builder: (context, snapshot) {
                  final locationName = snapshot.data ?? 'Carregando...';

                  return ListTile(
                    title: Text('Local: $locationName'),
                    subtitle: Text('Data: $date, Hora: $time'),
                    trailing: Text('R\$ $price'),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
