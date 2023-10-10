import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final List<String> _routes = [
    '',
    '/inicio',
    '/servicos',
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF2C1C55),
      type: BottomNavigationBarType.fixed,
      items: _buildBottomNavigationBarItems(),
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      currentIndex: BottomNavigationController.instance.index,
      onTap: (value) {
        if (value > 0) {
          BottomNavigationController.instance.changeIndex(value);
          Navigator.of(context).pushReplacementNamed(_routes[value]);
        } else {
          Scaffold.of(context).openDrawer();
        }
      },
      selectedLabelStyle: const TextStyle(fontSize: 9),
      unselectedLabelStyle: const TextStyle(fontSize: 9),
    );
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.menu),
        label: 'Menu',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home_filled),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.content_paste),
        label: 'Serviços',
      ),
    ].asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;

      return _buildBottomNavigationBarItem(index, item.label!);
    }).toList();
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      int index, String label) {
    return BottomNavigationBarItem(
      icon: _getIconForIndex(index),
      label: label,
    );
  }

  Widget _getIconForIndex(int index) {
    final isSelected = index == BottomNavigationController.instance.index;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            Icon(
              _getIconDataForIndex(index),
            ),
          ],
        ),
        if (isSelected)
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: 30,
            height: 2,
            color: Colors.grey,
          ),
      ],
    );
  }

  IconData _getIconDataForIndex(int index) {
    switch (index) {
      case 0:
        return Icons.menu;
      case 1:
        return Icons.home_filled;
      case 2:
        return Icons.content_paste;
      default:
        return Icons.menu;
    }
  }
}

class BottomNavigationController {
  static final BottomNavigationController instance =
      BottomNavigationController();

  int index = 2;
  void changeIndex(int newIndex) {
    index = newIndex;
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      bottomNavigationBar: BottomNavigation(),
    ),
  ));
}
