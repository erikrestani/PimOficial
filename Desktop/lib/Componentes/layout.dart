import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LayoutTelas extends StatelessWidget {
  final Widget body;
  final Widget? searchBar;
  final Widget? filter;

  const LayoutTelas({
    Key? key,
    required this.body,
    this.searchBar,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double bodySize = MediaQuery.of(context).size.height * 1;
    if (searchBar == null) {
      bodySize = bodySize + MediaQuery.of(context).size.height * 0.2;
    }

    return Row(
      children: [
        Container(
          width: 200,
          color: const Color(0xFF3A1E7A),
          child: Column(
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: const Color(0xFF3A1E7A),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1,
                  child: Image.asset('assets/images/sem_fundo_amais.png'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDrawerItem(
                      context, 'Início', Icons.home_filled, '/inicio'),
                  const SizedBox(height: 20),
                  buildDrawerItem(
                      context, 'Serviços', Icons.content_paste, '/servicos'),
                  const SizedBox(height: 20),
                  buildDrawerItem(
                      context, 'Meu perfil', Icons.account_circle, '/perfil'),
                  const SizedBox(height: 300),
                  buildDrawerItem(context, 'Configurações', Icons.settings, ''),
                  const SizedBox(height: 10)
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDrawerItem(context, 'Suporte', Icons.support_agent, ''),
                  const SizedBox(height: 250),
                  buildLogoutButton(context),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double bodySize = constraints.maxHeight * 0.2;
              if (searchBar == null) {
                bodySize += constraints.maxHeight * 0.79;
              }

              return Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    if (filter != null) filter!,
                    if (searchBar != null)
                      Container(
                        height: constraints.maxHeight * 0.8,
                        child: searchBar!,
                      ),
                    Container(
                      height: bodySize,
                      padding:
                          const EdgeInsets.only(right: 13, left: 13, top: 15),
                      child: body,
                    ),
                  ],
                ),
    
              );
              
            },
          ),
        ),
      ],
    );
  }

  Widget buildDrawerItem(
      BuildContext context, String label, IconData icon, String route) {
    return TextButton.icon(
      onPressed: () {
        if (route.isNotEmpty) {
          Navigator.of(context).pushReplacementNamed(route);
        }
      },
      icon: Icon(
        icon,
        color: const Color(0xFFA1A2BB),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Color(0xFFA1A2BB),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget buildLogoutButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('token');
        Navigator.of(context).pushReplacementNamed('/');
      },
      icon: Icon(
        Icons.exit_to_app,
        color: const Color(0xFFA1A2BB),
      ),
      label: Text(
        'Sair',
        style: const TextStyle(
          color: Color(0xFFA1A2BB),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
