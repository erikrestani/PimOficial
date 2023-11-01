import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/bottomnavigation.dart';
import 'package:AdegaToronto/Componentes/drawer.dart';
import 'package:AdegaToronto/Componentes/layout.dart';

class MeuPerfil extends StatefulWidget {
  const MeuPerfil({Key? key}) : super(key: key);

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Perfil',
      ),
      drawer: const DrawerAdega(),
      body: LayoutTelas(
        body: SingleChildScrollView(
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/images/image_perfil.png',
                          width: 90,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Nome:',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 12,
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
                    child: TextFormField(
                      controller: _nomeController,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.black),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 0),
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
                    fontSize: 12,
                    color: Color(0xFFA1A2BB), // Mesma cor que o título "Nome"
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
                    child: TextFormField(
                      controller: _emailController,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      enabled: false, // Set this to false to disable editing
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
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
                    fontSize: 12,
                    color: Color(0xFFA1A2BB), // Mesma cor que o título "Nome"
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
                    child: TextFormField(
                      controller: _telefoneController,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 150),
                    Container(
                      width: 140,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3A1E7A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
