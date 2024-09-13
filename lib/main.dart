import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:html' as html;
import 'package:locapp_front/screens/auth/auth_gate.dart';


void loadGoogleMapsScript() {
  final String googleMapsApiKey = dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
  final script = html.ScriptElement()
    ..src = 'https://maps.googleapis.com/maps/api/js?key=$googleMapsApiKey'
    ..type = 'text/javascript'
    ..async = true;
  html.document.body?.append(script);
}

void main() async {
  // Inicializa as variáveis de ambiente
  await dotenv.load();

  // Incializa o Google Maps
  loadGoogleMapsScript();

  // Incializa o Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Inicializa o App
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Locapp',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // Inglês
        Locale('pt'), // Português
      ],
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromARGB(255, 240, 244, 255), // Azul claro para a superfície
          onSurface: Colors.black, // Texto sobre a superfície
          primary: Color.fromARGB(255, 98, 0, 238), // Roxo vibrante
          onPrimary: Colors.white, // Texto sobre o roxo
          secondary: Color.fromARGB(255, 56, 108, 176), // Azul mais escuro para contraste
          onSecondary: Colors.white, // Texto sobre o azul secundário
          tertiary: Color.fromARGB(255, 187, 222, 251), // Azul claro terciário
          error: Colors.red, // Cor para erros
          outline: Color(0xFF424242), // Cor de contorno padrão
        ),
      ),

      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}