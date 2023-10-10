import 'package:flutter/material.dart';
import '/Componentes/bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerAdega extends StatelessWidget {
  const DrawerAdega({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color textColor = const Color(0xFFA1A2BB);
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
        color: Color.fromARGB(255, 58, 30, 122)
        ),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 58, 30, 122)
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 1,
                child: Image.asset('assets/images/sem_fundo_amais.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      BottomNavigationController instance =
                          BottomNavigationController.instance;
                      instance.changeIndex(0);
                      Navigator.of(context).pushReplacementNamed('/inicio');
                    },
                    icon: Icon(
                      Icons.home_filled,
                      color: textColor,
                    ),
                    label: Text(
                      'Painel',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      BottomNavigationController instance =
                          BottomNavigationController.instance;
                      instance.changeIndex(0);
                      Navigator.of(context).pushReplacementNamed('/servicos');
                    },
                    icon: Icon(
                      Icons.content_paste,
                      color: textColor,
                    ),
                    label: Text(
                      'Serviços',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      BottomNavigationController instance =
                          BottomNavigationController.instance;
                      instance.changeIndex(0);
                      Navigator.of(context).pushReplacementNamed('/perfil');
                    },
                    icon: Icon(
                      Icons.account_circle,
                      color: textColor,
                    ),
                    label: Text(
                      'Meu perfil',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 80), // Adiciona o espaçamento
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: textColor,
                    ),
                    label: Text(
                      'Configurações',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.support_agent,
                      color: textColor,
                    ),
                    label: Text(
                      'Suporte',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.remove('token');
                      Navigator.of(context).pushReplacementNamed('/');
                    },
                    icon: Icon(
                      Icons.exit_to_app,
                      color: textColor,
                    ),
                    label: Text(
                      'Sair',
                      style: TextStyle(
                        color: textColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
