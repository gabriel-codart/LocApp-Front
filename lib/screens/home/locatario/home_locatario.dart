import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locapp/screens/home/components/containers/primary_header.dart';
import 'package:locapp/screens/location/location-details.dart';
import 'package:locapp/screens/profile/locatario/user_adiciona_ambiente.dart';

class HomeLocatario extends StatefulWidget {
  const HomeLocatario({super.key});

  @override
  State<HomeLocatario> createState() => _HomeLocatarioState();
}

class _HomeLocatarioState extends State<HomeLocatario> {
  List<String> title = [
    'Espaço 01',
    'Espaço 02'
  ];

  String description = 'Descrição breve sobre o local de locação.';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Locais Cadastrados'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryHeaderContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Search container
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.2),
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
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              // Lista de locações
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  "Seus Locais Cadastrados",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              ListView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return LocalItem(
                    title: title[index],
                    price: price,
                    description: description,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserAdicionaAmbiente(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}

// Definição da classe LocalItem fora de HomeLocatario
class LocalItem extends StatelessWidget {
  const LocalItem({
    super.key,
    required this.title,
    required this.price,
    required this.description,
  });

  final String title;
  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 5),
          child: Container(
            width: 120,
            alignment: Alignment.center,
            child: Image.network(
              "https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
              height: 120,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
          child: Container(
            width: 230,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title, // Usa o título da string
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){},
                      child: Icon(
                        Icons.edit,
                        size: 25,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(5),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: Icon(
                        Icons.delete,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
