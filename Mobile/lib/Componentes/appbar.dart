import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const MyAppBar({super.key, required this.title, this.leading});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  // SvgPicture wifi_of = SvgPicture.asset('assets/icons/wifi_of.svg');

  IconData wifiOf = Icons.wifi_off;
  IconData wifi = Icons.wifi;
  late Future<IconData> wifiFuture;
  SvgPicture notification = SvgPicture.asset('assets/icons/notification.svg');
  late Timer _timer;

  Future<IconData> _verificarconexao() async {
    final result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      return wifi;
    } else {
      return wifiOf;
    }
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 800), (timer) async {
      setState(() {
        wifiFuture = _verificarconexao();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    wifiFuture = _verificarconexao();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: widget.leading,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 50, right: 10, top: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          FutureBuilder(
            future: wifiFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Icon(snapshot.data);
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          Center(
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/perfil");
                  },
                  icon: const Image(
                    image: AssetImage('assets/images/image_perfil.png'),
                  )),
              notification
            ],
          )
        ]),
      ),
      toolbarHeight: 50,
      backgroundColor: const Color(0xFF3A1E7A),
      elevation: 0,
    );
  }
}
