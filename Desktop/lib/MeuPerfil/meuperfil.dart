import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/layout.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class MeuPerfil extends StatefulWidget {
  const MeuPerfil({Key? key});

  @override
  State<MeuPerfil> createState() => _MeuPerfilState();
}

class _MeuPerfilState extends State<MeuPerfil> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<Map<String, dynamic>> fetchPerfil() async {
    final token = await SharedPreferences.getInstance().then((prefs) {
      return prefs.getString('token');
    });

    final response = await http.get(
      Uri.parse("http://172.20.10.5:3000/users/me"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Falha ao carregar dados do perfil. Código: ${response.statusCode}');
    }
  }

  Future<void> fetchData() async {
    try {
      final perfil = await fetchPerfil();
      setState(() {
        _nomeController.text = perfil['nome'];
        _emailController.text = perfil['email'];
        _telefoneController.text = perfil['telefone'];
      });
    } catch (e) {
      print('Erro ao buscar dados do perfil: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Perfil',
      ),
      backgroundColor: const Color(0xFF2C1C50),
      body: LayoutTelas(
        body: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 470, right: 16, top: 50),
            child: Container(
              height: 800,
              decoration: const BoxDecoration(
                color: Color(0xFF2C1C50),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/image_perfil.png',
                        width: 90,
                        height: 80,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Nome:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16, // Aumentei o tamanho da fonte
                      color: Color(0xFFA1A2BB),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 382,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(126, 126, 126, 1),
                        width: 0.5,
                      ),
                      color: const Color(0xFFA1A2BB),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          _nomeController.text,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16, // Aumentei o tamanho da fonte
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Email:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16, // Aumentei o tamanho da fonte
                      color: Color(0xFFA1A2BB),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 382,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(126, 126, 126, 1),
                        width: 0.4,
                      ),
                      color: const Color(0xFFA1A2BB),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 7.5),
                      child: Center(
                        child: Text(
                          _emailController.text,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16, // Aumentei o tamanho da fonte
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Telefone:',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 16, // Aumentei o tamanho da fonte
                      color: Color(0xFFA1A2BB),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 382,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(126, 126, 126, 1),
                        width: 0.5,
                      ),
                      color: const Color(0xFFA1A2BB),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Center(
                        child: Text(
                          _telefoneController.text,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16, // Aumentei o tamanho da fonte
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
