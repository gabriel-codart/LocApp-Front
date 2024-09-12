import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserSchedule extends StatefulWidget {
  const UserSchedule({super.key});

  @override
  _UserScheduleState createState() => _UserScheduleState();
}

class _UserScheduleState extends State<UserSchedule> {
  int _locacaoCount = 1;

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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 1; i < 4; i++)
                      Container(
                        height: 110,
                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Radio(
                              value: "",
                              groupValue: "",
                              activeColor: Theme.of(context).colorScheme.primary,
                              onChanged: (index) {},
                            ),
                            Container(
                              height: 70,
                              width: 70,
                              margin: const EdgeInsets.only(right: 15),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  "https://th.bing.com/th/id/OIP.KRCYXwee5sQvzcq485Bp8wHaFB?w=222&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Título do local",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "R\$15/Hora",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.plus,
                                            size: 16,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _locacaoCount++;
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        child: Text(
                                          "$_locacaoCount hora",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: IconButton(
                                          icon: const Icon(
                                            CupertinoIcons.minus,
                                            size: 16,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              if (_locacaoCount > 1) {
                                                _locacaoCount--;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "R\$45",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        // Chama o método para abrir o pop-up de pagamento
                        _showPaymentMethods(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        minimumSize: const Size(double.infinity, 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Finalizar',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
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
                        onChanged: (i) => setState(() => valor = i),
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
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Fechar o modal ao confirmar o método de pagamento
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                    ),
                    child: const Text('Confirmar', style: TextStyle(
                      color: Colors.black54
                    ),),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
