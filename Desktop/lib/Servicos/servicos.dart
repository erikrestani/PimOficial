import 'package:AdegaToronto/FolhadePagamento/folha.dart';
import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/layout.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Serviços',
      ),
      backgroundColor: const Color(0xFF2C1C50),
      body: LayoutTelas(
        body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 550, right: 20, top: 2),
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
                const SizedBox(height: 120),
                const Text(
                  'Serviços',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    color: Color(0xFFA1A2BB),
                  ),
                ),
                const SizedBox(height: 100),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => const FolhaPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF3A1E7A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(
                          20), // Ajuste o tamanho do botão
                    ),
                    child: const Text('Visualizar Holerite'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF3A1E7A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text('Contrato de Trabalho'),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A1E7A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.all(20),
                    ),
                    child: const Text('Minhas Vendas'),
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
