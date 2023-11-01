// ignore_for_file: library_private_types_in_public_api

import 'package:AdegaToronto/RecuperarSenha/recuperarsenha.dart';
import 'package:flutter/material.dart';
import '/HomePage/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.externalNonBrowserApplication)) {}
  {}
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Uri toLaunch = Uri.parse('http://www.youtube.com');
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              decoration: const BoxDecoration(
                color: Color(0xFF3A1E7A),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.37,
                    child: Center(
                      child: Image.asset(
                        'assets/images/logo_principal.png',
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
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
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        right: 30, left: 30, bottom: 1),
                                    child: Text(
                                      'Email',
                                      style:
                                          TextStyle(color: Color(0xFFA1A2BB)),
                                    ),
                                  ),
                                  const SizedBox(height: 8.4),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: 55,
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30, bottom: 10),
                                    child: TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFA1A2BB),
                                        suffixIcon: const Icon(
                                            Icons.email_outlined,
                                            color: Colors.black),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical:
                                              3, // diminui o padding vertical
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 30,
                                      left: 30,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      'Senha',
                                      style:
                                          TextStyle(color: Color(0xFFA1A2BB)),
                                    ),
                                  ),
                                  const SizedBox(height: 1),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: 55,
                                    padding: const EdgeInsets.only(
                                        right: 30, left: 30, bottom: 10),
                                    child: TextFormField(
                                      controller: _passwordController,
                                      obscureText: !_passwordVisible,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color(0xFFA1A2BB),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _passwordVisible =
                                                  !_passwordVisible;
                                            });
                                          },
                                          child: Icon(
                                            _passwordVisible
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 8, horizontal: 15),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: SizedBox(
                              height: 48,
                              child: Column(
                                children: [
                                  TextButton(
                                    onPressed: () async {
                                      await launchInBrowser(toLaunch);
                                    },
                                    child: const Text(
                                      "Não tem uma conta? Cadastre-se!",
                                      style: TextStyle(
                                          color: Color(0xFFA1A2BB),
                                          fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: 25,
                              child: Column(
                                children: [
                                  GestureDetector(
                                    child: const Text(
                                      "Esqueceu a senha? Recupere aqui",
                                      style: TextStyle(
                                          color: Color(0xFFA1A2BB),
                                          fontSize: 11),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const RecuperarSenhaMenu(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 45),
                          Center(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const Home(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFF3A1E7A),
                                  ),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.height *
                                      0.05),
                              child: const Center(
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
                          ),
                        ],
                      ),
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
