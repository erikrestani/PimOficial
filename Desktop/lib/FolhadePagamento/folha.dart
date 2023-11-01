import 'package:AdegaToronto/FolhadePagamento/folhagerada.dart';
import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/bottomnavigation.dart';
import 'package:AdegaToronto/Componentes/drawer.dart';
import 'package:AdegaToronto/Componentes/layout.dart';

class FolhaPage extends StatelessWidget {
  const FolhaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Holerite',
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
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'Preencha seus dados',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Digite seu ID',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: const Color(0xFFA1A2BB),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Digite seu nome',
                      hintStyle: const TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: const Color(0xFFA1A2BB),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFA1A2BB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      items: <String>[
                        'Caixa',
                        'Estoquista',
                        'Técnico',
                        'Motoboy',
                        'Barman'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // Adicione a lógica para atualizar o texto do cargo aqui
                      },
                      hint: const Text(
                        'Selecione o cargo',
                        style: TextStyle(color: Colors.black),
                      ),
                      dropdownColor: const Color(0xFFA1A2BB),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      style: const TextStyle(color: Colors.black),
                      underline: Container(), // Remove o sublinhado
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFA1A2BB),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButton<String>(
                      items: <String>[
                        'Janeiro',
                        'Fevereiro',
                        'Março',
                        'Abril',
                        'Maio',
                        'Junho',
                        'Julho',
                        'Agosto',
                        'Setembro',
                        'Outubro',
                        'Novembro',
                        'Dezembro'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        // Adicione a lógica para atualizar o texto do mês aqui
                      },
                      hint: const Text(
                        'Selecione o mês',
                        style: TextStyle(color: Colors.black),
                      ),
                      dropdownColor: const Color(0xFFA1A2BB),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      style: const TextStyle(color: Colors.black),
                      underline: Container(), // Remove o sublinhado
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const FolhaGeradaPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A1E7A),
                    ),
                    child: const Text('Confirmar'),
                  ),
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