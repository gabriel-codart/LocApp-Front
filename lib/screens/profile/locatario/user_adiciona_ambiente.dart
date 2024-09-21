import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locapp/screens/profile/locatario/maps/user_adiciona_mapa.dart';

class UserAdicionaAmbiente extends StatefulWidget {
  const UserAdicionaAmbiente({super.key});

  @override
  State<UserAdicionaAmbiente> createState() => _UserAdicionaAmbienteState();
}

class _UserAdicionaAmbienteState extends State<UserAdicionaAmbiente> {
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

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        dataCtr.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Future<void> _selectTime() async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        horaCtr.text = pickedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
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
                      child: _coverPhoto != null
                          ? Image.file(_coverPhoto!)
                          : const Image(
                              image: NetworkImage(
                                  "https://th.bing.com/th/id/OIP.KRCYXwee5sQvzcq485Bp8wHaFB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7"),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 2),
                Center(
                  child: ElevatedButton(
                    onPressed: _pickImage,
                    child: const Text('Escolher foto para local'),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: descrcaoCtr,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(133, 147, 146, 155)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 218, 220, 223)),
                      ),
                      label: Text('descrição'),
                      prefixIcon: Icon(Icons.text_decrease),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserAdicionaMapa()),
                      );
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: enderecoCtr,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(133, 147, 146, 155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 218, 220, 223)),
                          ),
                          label: Text('endereço'),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: _selectDate,
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: dataCtr,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(133, 147, 146, 155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 218, 220, 223)),
                          ),
                          label: Text('data'),
                          prefixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: _selectTime,
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: horaCtr,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(133, 147, 146, 155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 218, 220, 223)),
                          ),
                          label: Text('hora'),
                          prefixIcon: Icon(Icons.punch_clock),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    controller: valorCtr,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(133, 147, 146, 155)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 218, 220, 223)),
                      ),
                      label: Text('valor por hora'),
                      prefixIcon: Icon(Icons.money),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          // Adicionar lógica de salvar o ambiente aqui
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          side: BorderSide.none,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          'Adicionar',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
