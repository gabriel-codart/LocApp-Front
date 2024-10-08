import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locapp/screens/auth/components/my_text_field.dart';
import 'package:locapp/screens/home/root.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final senhaController = TextEditingController();
  final emailController = TextEditingController();
  final nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  IconData iconSenha = CupertinoIcons.eye_fill;
  bool obscureSenha = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomTextField(
              controller: senhaController,
              hintText: 'Senha',
              obscureText: obscureSenha,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),

               suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureSenha = !obscureSenha;
                    if(obscureSenha){
                      iconSenha = CupertinoIcons.eye_fill;
                    } else {
                      iconSenha = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconSenha),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomTextField(
              controller: senhaController,
              hintText: 'Confirmar Senha',
              obscureText: obscureSenha,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),

               suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureSenha = !obscureSenha;
                    if(obscureSenha){
                      iconSenha = CupertinoIcons.eye_fill;
                    } else {
                      iconSenha = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconSenha),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextButton(
              onPressed:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Root()),
                  );
              },
              style: TextButton.styleFrom(
                elevation: 3.0,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  'Entrar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ),
              ),
          )
        ],
      )
      );
  }
}