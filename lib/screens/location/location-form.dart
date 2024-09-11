import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationForm extends StatefulWidget {
  const ReservationForm({super.key});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedSpace = 'Espaço 1';

  // Método para exibir o seletor de data
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Método para exibir o seletor de hora
  Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? pickedTime = await showTimePicker(
    context: context,
    initialTime: selectedTime ?? TimeOfDay.now(),
    builder: (BuildContext context, Widget? child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: child!,
      );
    },
  );

  if (pickedTime != null && pickedTime != selectedTime) {
    setState(() {
      selectedTime = pickedTime;
    });
  }
}


  // Método para construir a tela de reserva
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fazer Reserva'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seletor de data
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        selectedDate != null
                            ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                            : 'Escolha a data',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),

            // Seletor de hora
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => _selectTime(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        selectedTime != null
                            ? selectedTime!.format(context)
                            : 'Escolha a hora',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Icon(Icons.access_time, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),

            // Seletor de espaço
            DropdownButton<String>(
              value: selectedSpace,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSpace = newValue;
                });
              },
              items: <String>['Espaço 1', 'Espaço 2', 'Espaço 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Botão de reserva
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para enviar os dados
                  print('Data: ${selectedDate != null ? DateFormat('dd/MM/yyyy').format(selectedDate!) : 'Não selecionada'}');
                  print('Hora: ${selectedTime != null ? selectedTime!.format(context) : 'Não selecionada'}');
                  print('Espaço: ${selectedSpace ?? 'Não selecionado'}');
                  
                  // Lógica de submissão do formulário
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Reserva realizada!')),
                  );
                },
                child: const Text('Confirmar Reserva'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
