import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:locapp_front/models/location.dart';
import 'package:locapp_front/screens/home/root.dart';

class ReservationForm extends StatefulWidget {
  final Location location;

  const ReservationForm({super.key, required this.location});

  @override
  _ReservationFormState createState() => _ReservationFormState();
}

class _ReservationFormState extends State<ReservationForm> {
  final fba.User? user = fba.FirebaseAuth.instance.currentUser;
  
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String? selectedSpace = 'Espaço 01';

  int? valor = 0;

  final paymentMetodos = [
    'Cartão Crédito / Débito',
    'Pagamento em Espécie',
    'Paypal',
    'Google Wallet',
  ];

  final paymenIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'Fazer Reserva',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exibe informações da locação
            Text('Local: ${widget.location.name}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Preço: R\$${widget.location.price} p/ horário', style: TextStyle(fontSize: 16)),
            
            const SizedBox(height: 20),

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
              items: <String>['Espaço 01', 'Espaço 02', 'Espaço 03']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Botão para abrir a seleção de forma de pagamento
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Chama o método para abrir o pop-up de pagamento
                  _showPaymentMethods(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  paymentMetodos[valor!],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const Divider(height: 30, thickness: 0.2, color: Colors.black54),

            // Botão de reserva
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(double.infinity, 40),
                ),
                onPressed: () async {
                  // Dados da reserva
                  final reservationData = {
                    'customer': user!.uid, // Atualizar com o ID do cliente logado
                    'location': widget.location.id,
                    'date': selectedDate != null ? DateFormat('dd/MM/yyyy').format(selectedDate!) : 'Não selecionada',
                    'time': selectedTime != null ? selectedTime!.format(context) : 'Não selecionada',
                    'price': widget.location.price,
                    'created_at': DateTime.now().toIso8601String(),
                    'forma_de_pagamento': paymentMetodos[valor!], // Adicionando o método de pagamento
                  };

                  try {
                    // Enviar dados para Firestore
                    await FirebaseFirestore.instance.collection('reservation').add(reservationData);

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Reserva realizada com sucesso!')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Root(),
                      ),
                    );
                  } catch (e) {
                    // Exibir mensagem de erro
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao realizar reserva: $e')),
                    );
                  }
                },
                child: const Text('Confirmar Reserva', style: TextStyle(color: Colors.white, fontSize: 22)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Método para abrir o pop-up de métodos de pagamento
  void _showPaymentMethods(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Selecione o método de pagamento",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                      itemCount: paymentMetodos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Radio(
                            value: index,
                            groupValue: valor,
                            onChanged: (i) {
                              setModalState(() {
                                valor = i; // Atualiza o valor no modal
                              });
                              setState(() {
                                valor = i; // Atualiza o valor na tela principal
                              });
                            },
                          ),
                          title: Text(
                            paymentMetodos[index],
                          ),
                          trailing: Icon(paymenIcons[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
