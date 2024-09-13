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
  String? selectedSpace = 'Espaço 01';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.calendar_today, color: Colors.grey),
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
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.access_time, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 20),

            // Seletor de espaço
            Container(
              width: 400,
              child: DropdownButton<String>(
                value: selectedSpace,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedSpace = newValue;
                  });
                },
                items: <String>['Espaço 01', 'Espaço 02', 'Espaço 03']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 30),
            // Botão de reserva
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedDate == null || selectedTime == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Selecione data e hora')),
                      );
                      return;
                    }
              
                    // Lógica para enviar os dados
                    print('Data: ${DateFormat('dd/MM/yyyy').format(selectedDate!)}');
                    print('Hora: ${selectedTime!.format(context)}');
                    print('Espaço: $selectedSpace');
              
                    // Lógica de submissão do formulário
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reserva realizada!')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  child: const Text('Confirmar Reserva', style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
