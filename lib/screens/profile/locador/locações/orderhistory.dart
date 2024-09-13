import 'package:flutter/material.dart';

class LocacoesUsuario extends StatefulWidget {
  const LocacoesUsuario({super.key});

  @override
  State<LocacoesUsuario> createState() => _LocacoesUsuarioState();
}

class _LocacoesUsuarioState extends State<LocacoesUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minhas locações"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SizedBox(
          height: 180,
          width: MediaQuery.of(context).size.width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.white,
            child: Container(
              color: Colors.white,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network("https://th.bing.com/th/id/OIP.Jmmf_v5iACxlM_zTth1frgHaGB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7", width: 80, height: 80,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("RESERVA3876554", style: TextStyle(
                              fontSize: 18,
                            ),),
                            Text("Preço R\$", style: TextStyle(
                              fontSize: 16,
                            ),),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Finalizada", style: TextStyle(fontSize: 16)),
                          )
                          ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 0.1, color: Colors.grey,),
                                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Data ${DateTime.now().toString().substring(0,10)}", style: TextStyle(
                          fontSize: 18,
                        ),),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Detalhes", style: TextStyle(fontSize: 16)),
                          )
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
        )
      )
    );
  }
}

