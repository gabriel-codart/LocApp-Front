import 'package:flutter/material.dart';

class PagamentosRecebidos extends StatefulWidget {
  const PagamentosRecebidos({super.key});

  @override
  State<PagamentosRecebidos> createState() => _PagamentosRecebidosState();
}

class _PagamentosRecebidosState extends State<PagamentosRecebidos> {
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
      appBar: AppBar(
         title: Center(
            child: Text(
              'Pagamentos Recebidos',
              style: TextStyle(color: Colors.black54),
            ),
          ),
      ),
      body:
          Container(
            padding: const EdgeInsets.all(20),
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Histórico de pagamentos", style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                    itemCount: paymentMetodos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Icon(paymenIcons[index]),
                        title: Text(paymentMetodos[index]),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 20, thickness: 0.1, color: Colors.grey,);
                    },
                    ),
                  ),
              ]
                ),
            ),
          );
  }
}