import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:locapp_front/screens/auth/welcome/welcome_button.dart';


class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(20, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(2.7, -1.2),
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.3,
                  width: MediaQuery.of(context).size.width / 1.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 95.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
              Column(
                children: [
                  Flexible(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40.0),
                      child: Center(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Bem-Vindo!\n',
                                style: TextStyle(
                                  fontSize: 45.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),

                              ),
                              TextSpan(
                                text: '\nPor-favor escolha uma das opções abaixo.',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        children: [
                          Expanded(
                            child: WelcomeButton(
                              buttonText: "Locador",
                              color: Colors.transparent,
                              textColor: Colors.black54,
                            ),
                          ),
                          Expanded(
                            child: WelcomeButton(
                              buttonText: "Locatário",
                              color: Color.fromARGB(255, 240, 240, 240),
                              textColor: Color.fromARGB(255, 89, 131, 230),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}