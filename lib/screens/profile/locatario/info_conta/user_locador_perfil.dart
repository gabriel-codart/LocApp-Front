import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locapp_front/screens/auth/welcome/welcome_screen.dart';
import 'package:locapp_front/screens/profile/config/user_config_screen.dart';
import 'package:locapp_front/screens/profile/info_conta/edit_info/user_locador_edit_profile.dart';
import 'package:locapp_front/screens/profile/info_conta/info_sistema.dart';
import 'package:locapp_front/screens/profile/locador/user_profile.dart';
import 'package:locapp_front/screens/profile/locatario/info_conta/user_locatario_conta_info.dart';

class UserLocadorPerfil extends StatefulWidget {
  const UserLocadorPerfil({super.key});

  @override
  State<UserLocadorPerfil> createState() => _UserLocadorPerfilState();
}

class _UserLocadorPerfilState extends State<UserLocadorPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ListTile(
                leading: const Image(image: NetworkImage("https://th.bing.com/th/id/OIP.6vwZcc33X4K1oOH5puuU_gHaF7?w=225&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7",), width: 50, height: 50,),
                title: Text('Usuário 01', style: TextStyle(color: Colors.black),),
                subtitle: Text('usuario@gmail.com', style: TextStyle(color: Colors.black),),
                trailing: IconButton(
                  onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UserLocadorEditProfile()));
                    },
                  icon: Icon(Icons.edit, color: Theme.of(context).colorScheme.secondary,),
                  ),
              ),
              const SizedBox(height: 30,),
              const Divider(thickness: 0.1, color: Colors.grey,),
              const SizedBox(height: 10,),

              ProfileMenu(
                title: 'Configuração', 
                subtitle: "Notificações e cache",
                icon: CupertinoIcons.gear, 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserConfigScreen()));
                },),

              ProfileMenu(
                title: 'Registro de Locadores', 
                subtitle: "Usuários que já agendaram seu local",
                icon: CupertinoIcons.calendar,
                 onPressed: (){}),

              ProfileMenu(
                title: 'Conta', 
                subtitle: "Conta e Segurança",
                icon: CupertinoIcons.person_alt_circle, 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserLocatarioContaInfo()));
                }),

              const Divider(height: 10, thickness: 0.1, color: Colors.grey,),
              ProfileMenu(
                title: 'Informações', 
                subtitle: "informações do sistema",
                icon: CupertinoIcons.add, 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const InfoSistema()));
                }),

              ProfileMenu(
                title: "Sair", 
                subtitle: "",
                icon: Icons.logout, 
                textColor: Colors.red,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                ),
            ],
          ),
        ),
      ),
    );
  }
}