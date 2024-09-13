import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locapp_front/screens/profile/locador/pagamento/user_pagamento.dart';
import 'package:locapp_front/screens/profile/locador/senha/redefinir_senha.dart';
import 'package:locapp_front/screens/profile/locador/user_profile.dart';

class UserContaInfo extends StatefulWidget {
  const UserContaInfo({Key? key}): super(key: key); 

  @override
  State<UserContaInfo> createState() => _UserContaInfoState();
}


class _UserContaInfoState extends State<UserContaInfo> {
  bool valNotify1 = false;

  onChangedFunction1(bool newValue1){
    setState(() {
      valNotify1 = newValue1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title:  Center(child: Text("Conta e Segurança", style: TextStyle(color: Colors.black54, fontSize: 22),)), 
      ),
    body: Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.person, color: Colors.black54),
              const SizedBox(width: 10,),
              Text("Conta", style: TextStyle(
                fontSize: 20,
              ),),
            ],
          ),
          const Divider(height: 20, thickness: 0.1,),
          const SizedBox(height: 10,),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: builAccountOption(context, "Redefinir senha", icon: CupertinoIcons.lock, onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const RedefinirSenha()));
          }),
          ),

          const SizedBox(height: 10,),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: builAccountOption(context, "Métodos de Pagamento", icon: Icons.payment, onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const UserPagamento()));
          } ),
          ),

          const SizedBox(height: 40,),
          Row(
            children: [
              Icon(Icons.volume_up_outlined, color: Theme.of(context).colorScheme.primary,),
              const SizedBox(width: 10,),
              Text("Notificações", style: TextStyle(
                fontSize: 20
              ),),
            ],
          ),
          const Divider(height: 20, thickness: 0.1,),
          const SizedBox(height: 10,),
          buildNotificationOption("Theme Dark", valNotify1, onChangedFunction1),
        ],
      ),
    ),
      
    );
  }
}

Padding buildNotificationOption(String title, bool value, void Function(bool) onChangedMethod){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 20),),
        Transform.scale(
          scale: 0.7,
          child: Switch(
            activeColor: Colors.blue,
            trackColor: WidgetStateProperty.all(Colors.grey), 
            value: value,
            onChanged: (bool newValue){
              onChangedMethod(newValue);
            },
          ),
        ),
      ],
    ),
  );
}

Widget builAccountOption(BuildContext context, String title, {required VoidCallback onPressed, required IconData icon,}) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10,),
              Text(title, style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),),
            ],
          ),
          SizedBox(
            child: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          )
        ],
      ),
    ),
  );
}