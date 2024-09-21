import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart' as fba;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';

import 'package:locapp/screens/auth/auth_gate.dart';
import 'package:locapp/screens/profile/config/user_config_screen.dart';
import 'package:locapp/screens/profile/info_conta/info_sistema.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final fba.FirebaseAuth? auth;

  _UserProfileState({this.auth});

  final fba.User? user = fba.FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              ProfileMenu(
                title: user!.displayName != null ? user!.displayName! : "Perfil", 
                subtitle: user!.email!,
                icon: CupertinoIcons.person_alt_circle, 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<ProfileScreen>(
                      builder: (context) => ProfileScreen(
                        appBar: AppBar(
                          title: const Text("Perfil"),
                        ),
                        actions: [
                          SignedOutAction((context) {
                            Navigator.of(context).pop();
                          })
                        ],
                        showDeleteConfirmationDialog: true,
                        children: [
                          const Divider(height: 20, thickness: 0.2, color: Colors.black54),

                          Text("Id: " + user!.uid),

                          const Divider(height: 20, thickness: 0.2, color: Colors.black54),

                          Text("Email: " + user!.email!),
                          Text(user!.emailVerified? "Verificado" : "Não verificado", style: const TextStyle(fontWeight: FontWeight.bold)),

                          const Divider(height: 20, thickness: 0.2, color: Colors.black54),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const Divider(height: 20, thickness: 0.2, color: Colors.black54),

              ProfileMenu(
                title: "Configuração", 
                subtitle: "Notificações e cache",
                icon: CupertinoIcons.gear, 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserConfigScreen()));
                },
              ),

              ProfileMenu(
                title: "Detalhes das Locações", 
                subtitle: "Em progresso ou finalizadas",
                icon: CupertinoIcons.calendar, 
                onPressed: (){},
              ),

              const Divider(height: 20, thickness: 0.2, color: Colors.black54),

              ProfileMenu(
                title: "Informação",
                subtitle: "Termos e Privacidade", 
                icon: CupertinoIcons.info, 
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoSistema()));
                }
              ),

              ProfileMenu(
                title: "Logout", 
                subtitle: "Sair da conta",
                icon: Icons.logout, 
                textColor: Colors.red,
                onPressed: (){
                  FirebaseUIAuth.signOut(
                    context: context,
                    auth: auth,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthGate()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,

      leading: Container(
        width: 40, 
        height: 40,
        child: Icon(icon),
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium?.apply(color: textColor),),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium?.apply(color: textColor)),
      trailing: endIcon? Container(
              width: 30, 
              height: 30,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.transparent
              ),
              child: const Icon(Icons.arrow_forward_ios, color: Colors.black87, size: 16,),
            ) : null, 
    );
   
  }
}

