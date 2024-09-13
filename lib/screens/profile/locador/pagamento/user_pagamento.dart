import 'package:flutter/material.dart';

class UserPagamento extends StatefulWidget {
  const UserPagamento({super.key});

  @override
  State<UserPagamento> createState() => _UserPagamentoState();
}

class _UserPagamentoState extends State<UserPagamento> {
  final paymentMetodos = [
    'Cartão de crédito / débito: Visa, Mastercard, etc.',
    'Dinheiro na hora: Pagamento em espécie',
    'Paypal: Pagamento online',
    'Google Wallet: Pagamento online',
  ];

  final paymenIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];
  int? valor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Métodos de Pagamento",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),

      body: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.black54),
                const SizedBox(width: 10),
                Text(
                  "Seus Registros",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 10, thickness: 0.1, color: Colors.grey),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              itemCount: paymentMetodos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(paymenIcons[index]),
                  title: Text(paymentMetodos[index]),
                  trailing: Icon(
                    Icons.delete,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 20, thickness: 0.1, color: Colors.grey);
              },
            ),
          ),
        ],
      ),

      // Adicionando o botão 'Adicionar'
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Adicionar Novo Método'),
                content: Text('Aqui você pode adicionar um novo método de pagamento.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Lógica para adicionar novo método
                      Navigator.pop(context);
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
