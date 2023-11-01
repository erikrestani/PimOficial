import 'package:AdegaToronto/HomePage/homepage.dart';
import 'package:AdegaToronto/MeuPerfil/meuperfil.dart';
import 'package:AdegaToronto/Servicos/servicos.dart';
import 'package:flutter/material.dart';
import 'LoginPage/loginpage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 18, 69, 164),
          fontFamily: 'Poppins'),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/inicio': (context) => const Home(),
        '/perfil': (context) => const MeuPerfil(),
        '/servicos': (context) => const ServicosPage(),
      },
    );
  }
}
