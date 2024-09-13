import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locapp_front/screens/auth/components/my_text_field.dart';
import 'package:locapp_front/screens/home/root_page.dart';

class UserAdicionaAmbiente extends StatefulWidget {
  const UserAdicionaAmbiente({super.key});

  @override
  State<UserAdicionaAmbiente> createState() => _SignUpState();
}

class _SignUpState extends State<UserAdicionaAmbiente> {
  final descrcaoCtr = TextEditingController();
  final valorCtr = TextEditingController();
  final imagemCtr = TextEditingController();
  final enderecoCtr = TextEditingController();
  final dataCtr = TextEditingController();
  final horaCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File? _coverPhoto;

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _coverPhoto = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
              'Adicionar Local',
              style: TextStyle(color: Colors.black54),
            ),
          ),
      ),
      body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child:  _coverPhoto != null 
                          ? Image.file(_coverPhoto!)
                          : const Image( 
                            image: NetworkImage("https://th.bing.com/th/id/OIP.KRCYXwee5sQvzcq485Bp8wHaFB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                          ),
                      ),
                    ),
              ),
              SizedBox(height: 2,),
              Center(
                child: ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Escolher foto para local'),
                ),
              ),
              
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: descrcaoCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('descrição'), 
                    prefixIcon: Icon(Icons.text_decrease),
                    ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: enderecoCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('endereço'), 
                    prefixIcon: Icon(Icons.map),
                  )
                ),
              ),
                  const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: dataCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('data'), 
                    prefixIcon: Icon(Icons.house),
                  )
                ),
              ),
                  const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: horaCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                     borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('hora'), 
                    prefixIcon: Icon(Icons.punch_clock),
                  )
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextFormField(
                  controller: valorCtr,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(133, 147, 146, 155)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 218, 220, 223)),
                    ),
                    label: Text('valor por hora'), 
                    prefixIcon: Icon(Icons.money)),
                ),
              ),
              const SizedBox(height: 20,),
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
                      child: const Text('Adicionar', style: TextStyle(color: Colors.black),)
                      ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      )
    );
    
  }
}