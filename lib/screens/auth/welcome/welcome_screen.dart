import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:locapp_front/screens/auth/sign_process/sign_in.dart';
import 'package:locapp_front/screens/auth/sign_process/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override 
  void initState (){
    tabController = TabController( 
      initialIndex: 0,
      length: 2,
      vsync: this
    );
    super.initState();
  }
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
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child: Column(
                      children: [
                       Padding(
                          padding: const EdgeInsets.only(top: 1), // Ajuste o padding se necessário
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Login/Cadastro\n',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 50,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: TabBar(
                            controller: tabController,
                            unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            labelColor: Theme.of(context).colorScheme.onSurface,
                            tabs: const [
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                ),
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                ),
                            ],
                            ),
                          ),
                          Expanded(
                            child: TabBarView(
                              controller: tabController,
                              children: const [
                                SigInScreen(),
                                SignUp(),
                              ],
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}