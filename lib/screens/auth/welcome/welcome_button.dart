import 'package:flutter/material.dart';
import 'package:locapp_front/screens/auth/welcome/welcome_screen.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key, this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
      },
      
      child: MouseRegion(
        cursor: SystemMouseCursors.click, 
        child: Container(
          padding: const EdgeInsets.all(10.0), 
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: color!,
            borderRadius: BorderRadius.circular(15),
            border: BorderDirectional(
              start: BorderSide(width: 1.5, color: Theme.of(context).colorScheme.secondary),
              end: BorderSide(width: 1.5, color: Theme.of(context).colorScheme.secondary),
           ),
           boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(.1),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 5), 
            ),
          ],
          ),
          child: Text(
            buttonText!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: textColor!,
            ),
          ),
        ),
      ),
    );
  }
}