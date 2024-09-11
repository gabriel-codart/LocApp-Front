import 'package:flutter/material.dart';
import 'package:locapp_front/screens/location/location-form.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:locapp_front/screens/home/components/containers/primary_header.dart';

class LocationDetails extends StatefulWidget {
  const LocationDetails({super.key});

  @override
  State<LocationDetails> createState() => _LocationDetailsState();
}

class _LocationDetailsState extends State<LocationDetails> {
  // Variáveis para armazenar os dados dinâmicos
  String title = 'Nome do Local';
  String description = 'Descrição breve sobre o local de locação.';
  List<String> imageUrls = [
    'https://th.bing.com/th/id/OIP.r5jzGByVNVqcIi7q0n09kAHaHa?w=199&h=199&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    'https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
  ];
  List<Map<String, String>> openingHours = [
    {'day': 'Dom', 'hours': '--'},
    {'day': 'Seg', 'hours': '08h - 18h'},
    {'day': 'Ter', 'hours': '08h - 18h'},
    {'day': 'Qua', 'hours': '08h - 18h'},
    {'day': 'Qui', 'hours': '08h - 18h'},
    {'day': 'Sex', 'hours': '08h - 18h'},
    {'day': 'Sab', 'hours': '--'}
  ];
  String price = 'R\$18 p/ Horário';

  bool isFavorited = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com botão de voltar, título e favoritar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                color: Theme.of(context).colorScheme.surface,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Botão de voltar
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    
                    // Nome do local centralizado
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    
                    // Botão de favoritar
                    IconButton(
                      icon: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isFavorited = !isFavorited;
                        });
                      },
                    ),
                  ],
                ),
              ),

              // Carrossel de imagens dinâmico
              Container(
                height: size.height * 0.4,
                child: PageView(
                  children: imageUrls.map((url) {
                    return Image.network(
                      url,  // Imagens dinâmicas
                      fit: BoxFit.cover,
                    );
                  }).toList(),
                ),
              ),

              // Descrição do local
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  description,  // Descrição dinâmica
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),

              // Tabela de horários dinâmicos
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Table(
                  border: TableBorder.symmetric(
                    inside: BorderSide(color: Colors.grey.withOpacity(0.5)),
                  ),
                  children: [
                    TableRow(
                      children: openingHours.map((day) {
                        return TableCell(
                          child: Center(child: Text(day['day']!)),
                        );
                      }).toList(),
                    ),
                    TableRow(
                      children: openingHours.map((day) {
                        return TableCell(
                          child: Center(child: Text(day['hours']!)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              // Preço e botão de reservar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,  // Preço dinâmico
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ReservationForm()),
                        );
                      },
                      label: const Text('Reservar'),
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
