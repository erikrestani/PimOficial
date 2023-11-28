import 'package:AdegaToronto/Componentes/layout.dart';
import 'package:flutter/material.dart';
import '/Componentes/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, double> dataMap = {
    "Janeiro": 2880.50,
    "Fevereiro": 12345.89,
    "Março": 15890.90,
    "Abril": 22880.50
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Painel',
      ),
      backgroundColor: const Color(0xFF2C1C50),
      body: LayoutTelas(
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            SingleChildScrollView(
              child: Container(
                height: 800,
                decoration: const BoxDecoration(
                  color: Color(0xFF2C1C50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(180),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          '\$22,880.50',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                        Text(
                                          'FATURAMENTO TOTAL',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Icon(
                                      Icons.assignment_turned_in,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 5,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.deepPurple,
                                          width: 1,
                                        ),
                                        color: Colors.purple,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Text(
                                    '67%',
                                    style: TextStyle(
                                      color: Color(0xFFA1A2BB),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '\$1,096.30',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                        Text(
                                          'VENDIDO NO MÊS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      child: Icon(
                                        Icons.account_balance_wallet,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.green,
                                            width: 1,
                                          ),
                                          color: const Color(0xFFA1A2BB),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '18%',
                                      style: TextStyle(
                                        color: Color(0xFFA1A2BB),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '1500',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                        Text(
                                          'PEDIDOS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                      child: Icon(
                                        Icons.auto_graph_outlined,
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.yellow,
                                            width: 1,
                                          ),
                                          color: const Color(0xFFA1A2BB),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 8), // Ajustado o espaçamento
                                    const Text(
                                      '78%',
                                      style: TextStyle(
                                        color: Color(0xFFA1A2BB),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          '500',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                        Text(
                                          'PRODUTOS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFA1A2BB),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Expanded(
                                        child: Icon(Icons.backpack_outlined)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 5,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFA1A2BB),
                                            width: 1,
                                          ),
                                          color: const Color(0xFFA1A2BB),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                        width: 8), // Ajustado o espaçamento
                                    const Text(
                                      '80%',
                                      style: TextStyle(
                                        color: Color(0xFFA1A2BB),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
