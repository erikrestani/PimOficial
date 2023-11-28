import 'package:flutter/material.dart';

class FolhaGeradaPage extends StatelessWidget {
  final String name;
  final String selectedMonth;
  final List<String> payrollDetails;

  const FolhaGeradaPage({
    Key? key,
    required this.name,
    required this.selectedMonth,
    required this.payrollDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implemente a lógica para exibir os detalhes da folha de pagamento
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Folha de Pagamento'),
      ),
      body: Column(
        children: [
          Text('Nome: $name'),
          Text('Mês Selecionado: $selectedMonth'),
          // Adicione mais widgets para exibir outros detalhes da folha de pagamento
        ],
      ),
    );
  }
}

class FolhaDto {
  final String userId;
  final String name;
  final String role;
  final String month;
  final String baseSalary;
  final String totalReceived;

  FolhaDto({
    required this.userId,
    required this.name,
    required this.role,
    required this.month,
    required this.baseSalary,
    required this.totalReceived,
  });

  factory FolhaDto.fromJson(Map<String, dynamic> json) {
    return FolhaDto(
      userId: json['userId'].toString(),
      name: json['name'].toString(),
      role: json['role'].toString(),
      month: json['month'].toString(),
      baseSalary: json['baseSalary'].toString(),
      totalReceived: json['totalReceived'].toString(),
    );
  }
}
