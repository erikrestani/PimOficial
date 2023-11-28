import 'package:AdegaToronto/LoginPage/loginpage.dart';
import 'package:flutter/material.dart';

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecuperarSenhaMenu(),
    );
  }
}

class RecuperarSenhaMenu extends StatefulWidget {
  const RecuperarSenhaMenu({super.key});

  @override
  State<RecuperarSenhaMenu> createState() => _RecuperarSenhaMenu();
}

class _RecuperarSenhaMenu extends State<RecuperarSenhaMenu> {
  // String _email = "";

  // void recuperarSenha() async {
  //   final url = 'http://191.252.196.214:3000/cadastro/recuperar';

  //   final response = await http.post(Uri.parse(url), body: {'EMAIL': _email});

  //   if (response.statusCode == 201) {
  //     // A requisição foi bem-sucedida
  //     Fluttertoast.showToast(
  //       msg: 'Senha enviada. Verifique seu email!',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //   } else {
  //     // A requisição falhou
  //     Fluttertoast.showToast(
  //       msg: 'Falha ao enviar senha. Tente novamente mais tarde.',
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.BOTTOM,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 5, left: 100),
          child: Image.asset('assets/images/logo_principal.png'),
        ),
        toolbarHeight: 200,
        backgroundColor: const Color(0xFF3A1E7A),
        elevation: 0,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0, color: Colors.transparent),
              color: const Color(0xFF3A1E7A),
            ),
          ),
          Container(
            height: 800,
            decoration: const BoxDecoration(
              color: Color(0xFF2C1C50),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Recuperar Senha",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Color(0xFFA1A2BB),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 90, right: 160),
                          child: Text(
                            'Email ou Telefone',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              color: Color(0xFFA1A2BB),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 1,
                          height: 60,
                          padding: const EdgeInsets.only(
                              right: 30, left: 30, bottom: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFA1A2BB),
                              suffixIcon: const Icon(Icons.email_outlined,
                                  color: Colors.black),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 3, // diminui o padding vertical
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 130),
                          child: Column(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginPage(),
                                    ),
                                  );
                                },
                                style: OutlinedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 40),
                                  backgroundColor: const Color(0xFF3A1E7A),
                                ),
                                child: const Text(
                                  'Recuperar',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 110),
                      child: Center(
                        child: Text(
                          'v0101 - AdegaToronto',
                          style: TextStyle(
                            fontSize: 11,
                            fontFamily: 'Poppins',
                            color: Color(0xFFA1A2BB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
