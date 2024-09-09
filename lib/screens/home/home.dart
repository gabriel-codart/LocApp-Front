import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:locapp_front/screens/home/components/containers/primary_header.dart';
import 'package:locapp_front/screens/location/location-details.dart';
import 'package:locapp_front/widgets/bottom.navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<String> _categorias = [
    'Recomendado', 
    'Longa duração', 
    'Curta duração', 
    'Eventos', 
    'Negócios', 
    'Lazer'
  ];

  bool toggleIsFavorited(bool isFavorited) {
    return !isFavorited;
  }

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
              // Header com campo de pesquisa e categorias
              PrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container de busca
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.1),
                                borderRadius: BorderRadius.circular(30),                   
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.search,
                                    color: Colors.black54.withOpacity(.6),
                                  ),
                                  const SizedBox(width: 8),
                                  const Expanded(
                                    child: TextField(
                                      showCursor: false,
                                      decoration: InputDecoration(
                                        hintText: 'Pesquisar por locação',
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    CupertinoIcons.mic,
                                    color: Colors.black54.withOpacity(.6),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Categorias
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        "Categorias",
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Container(
                      height: 90,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(_categorias.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
                              child: Icon(
                                Icons.apartment,
                                size: 30,
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
          
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Populares",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              // Cards de locais populares
              SizedBox(
                height: size.height * .3,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _categorias.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationDetails()),
                              );
                            },
                            child: Container(
                              width: 200,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(20), 
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 5), 
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 50,
                                    right: 50,
                                    top: 40,
                                    bottom: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                        "https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 20,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.favorite_border),
                                        color: Theme.of(context).colorScheme.secondary,
                                        onPressed: () {
                                          // Lógica de favoritar
                                        },
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    left: 20,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Eventos',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                          ),
                                        ),
                                        Text(
                                          'Ambiente 1',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 15,
                                    right: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        'R\$18',
                                        style: TextStyle(
                                          color: Theme.of(context).colorScheme.primary,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          
              // Cards de novidades
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Novidade",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.transparent,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * .2,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LocationDetails()),
                              );
                            },
                            child: Container(
                              width: size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.surface,
                                borderRadius: BorderRadius.circular(20), 
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 5), 
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image(
                                        image: NetworkImage(
                                          "https://th.bing.com/th/id/OIP.KRCYXwee5sQvzcq485Bp8wHaFB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                                        ),
                                        height: 120,
                                        width: 150,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 190,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "Edifício 02",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        Text(
                                          "Localização incrível",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        RatingBarIndicator(
                                          rating: 4.5,
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Theme.of(context).colorScheme.secondary,
                                          ),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          "R\$15 / Hora",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context).colorScheme.primary,
                                          ),
                                        ),
                                        
                                      ],
                                      
                                    ),
                                    
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.favorite_border, color: Theme.of(context).colorScheme.secondary, size: 26,),
                                        IconButton(
                                          icon: Icon(Icons.calendar_today, size: 26, color: Theme.of(context).colorScheme.secondary,),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => LocationDetails()),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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