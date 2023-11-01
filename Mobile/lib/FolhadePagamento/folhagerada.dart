import 'package:AdegaToronto/FolhadePagamento/folha.dart';
import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/bottomnavigation.dart';
import 'package:AdegaToronto/Componentes/drawer.dart';
import 'package:AdegaToronto/Componentes/layout.dart';

class FolhaGeradaPage extends StatelessWidget {
  const FolhaGeradaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Holerite',
      ),
      drawer: const DrawerAdega(),
      body: LayoutTelas(
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              color: Color(0xFF2C1C50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalhes da Holerite:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                _buildDetailItem('ID do Funcionário', '123456'),
                const SizedBox(height: 20),
                _buildDetailItem('Nome do Funcionário', 'Nome Sobrenome'),
                const SizedBox(height: 20),
                _buildDetailItem('Cargo', 'Caixa'),
                const SizedBox(height: 20),
                _buildDetailItem('Mês', 'Jan 2023'),
                const SizedBox(height: 20),
                _buildSalaryItem('Salário Base', 'R\$ 5.000,00'),
                const SizedBox(height: 20),
                _buildSalaryItem('Bônus', 'R\$ 500,00'),
                const SizedBox(height: 20),
                _buildSalaryItem('Descontos', 'R\$ 200,00'),
                const SizedBox(height: 20),
                _buildTotalSalary('Total Recebido', 'R\$ 5.300,00'),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    width: 140,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const FolhaPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3A1E7A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildSalaryItem(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildTotalSalary(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
