// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:AdegaToronto/Servicos/servicos.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:AdegaToronto/Componentes/appbar.dart';
import 'package:AdegaToronto/Componentes/bottomnavigation.dart';
import 'package:AdegaToronto/Componentes/drawer.dart';
import 'package:AdegaToronto/Componentes/layout.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FolhaPage extends StatefulWidget {
  const FolhaPage({Key? key}) : super(key: key);

  @override
  _FolhaPageState createState() => _FolhaPageState();
}

class _FolhaPageState extends State<FolhaPage> {
  String selectedMonth = "Selecione o mês";
  Map<String, dynamic> payrollDetails = {
    "userId": "",
    "name": "",
    "role": "",
    "month": "",
    "baseSalary": "",
    "totalReceived": "",
  };
  List<String> payrollmonths = ["Selecione o mês"];

  @override
  void initState() {
    super.initState();
    getPayrollMonths();
  }

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
            decoration: const BoxDecoration(
              color: Color(0xFF2C1C50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButton<String>(
                    value: selectedMonth.isEmpty
                        ? payrollmonths.first
                        : selectedMonth,
                    items: payrollmonths.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          selectedMonth = value;
                        });
                        if (value == "Selecione o mês") {
                          getPayrollMonths(); // Recarrega a lista ao escolher "Selecione o mês"
                        } else {
                          getPayrollDetails();
                        }
                      }
                    },
                    hint: const Text(
                      'Selecione o mês',
                      style: TextStyle(color: Colors.white),
                    ),
                    dropdownColor: const Color(0xFFA1A2BB),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    style: const TextStyle(color: Colors.white),
                    underline: Container(),
                  ),
                ),
                const SizedBox(height: 10),
                if (payrollDetails.isNotEmpty)
                  Column(
                    children: [
                      _buildText('ID do funcionário', payrollDetails["userId"]),
                      _buildText('Nome do funcionário', payrollDetails["name"]),
                      _buildText('Cargo', payrollDetails["role"]),
                      _buildText('Mês', payrollDetails["month"]),
                      _buildText('Salário Base', payrollDetails["baseSalary"],
                          color: Colors.green),
                      _buildText(
                          'Total Recebido', payrollDetails["totalReceived"],
                          color: Colors.green),
                    ],
                  )
                else
                  _buildText('Selecione o mês para ver os detalhes', ""),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 140,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ServicosPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: const Color(0xFF3A1E7A),
                    padding: const EdgeInsets.all(25),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.white,
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

  Future<String?> getAuthToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  getPayrollDetails() async {
    const apiUrl = "http://172.20.10.5:3000/payroll/getPayroll";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // final token = await getAuthToken();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token ?? '');
    var userId = decodedToken['userId'];

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "userId": userId,
          "month": selectedMonth,
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> payroll = jsonDecode(response.body);
        final details = payroll[0];

        // Defina o mês selecionado se ainda não estiver definido

        setState(() {
          payrollDetails = {
            "userId": details["userId"].toString(),
            "name": details["name"].toString(),
            "role": details["role"].toString(),
            "month": details["month"].toString(),
            "baseSalary": details["baseSalary"].toString(),
            "totalReceived": details["totalReceived"].toString(),
          };
        });
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to load payroll details');
      }
    } catch (error) {
      print('Error during request: $error');
      throw Exception('Failed to load payroll details');
    }
  }

  getPayrollMonths() async {
    const apiUrl = "http://172.20.10.5:3000/payroll/getPayrollMonths";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    // final token = await getAuthToken();
    print(token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token ?? '');
    var userId = decodedToken['userId'];

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "userId": userId,
        }),
      );

      if (response.statusCode == 200) {
        final List<dynamic> payroll = jsonDecode(response.body);
        setState(() {
          payrollmonths = [
            "Selecione o mês",
            ...List<String>.from(payroll)
          ]; // Adicionada opção "Selecione o mês" antes dos meses obtidos
        });
      } else {
        print('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Failed to load payroll details');
      }
    } catch (error) {
      print('Error during request: $error');
      throw Exception('Failed to load payroll details');
    }
  }

  Widget _buildText(String label, dynamic value, {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '$value',
            style: TextStyle(
              color: color ?? Colors.white,
              fontWeight: color != null ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}
