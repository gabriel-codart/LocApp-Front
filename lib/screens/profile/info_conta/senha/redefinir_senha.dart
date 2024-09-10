import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RedefinirSenha extends StatefulWidget {
  const RedefinirSenha({super.key});

  @override
  State<RedefinirSenha> createState() => _RedefinirSenhaState();
}

class _RedefinirSenhaState extends State<RedefinirSenha> {
  final senhaCtr = TextEditingController();
  final novaSenhaCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Redefinir senha',
              style: TextStyle(color: Colors.black54),
            ),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Alterar Senha", style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  ),),
              ),
            ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("Por-favor digite senha atual", style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: senhaCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('Senha atual'), 
                    prefixIcon: Icon(CupertinoIcons.lock),
                  )
                ),
              ),
            const SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: novaSenhaCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('Nova senha'), 
                    prefixIcon: Icon(CupertinoIcons.lock),
                  )
                ),
              ),
            const SizedBox(height: 40,),
            Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.secondary,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      child: const Text('Salvar', style: TextStyle(color: Colors.black),)
                      ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}