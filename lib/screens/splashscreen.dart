import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  bool isFirstIntro = false;

  @override
  void initState() {
    super.initState();
    secondLogin();
  }

  secondLogin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      isFirstIntro = sf.getBool('first') ?? false;
      if (isFirstIntro) {
        Navigator.of(context).pushReplacementNamed('/');
      }
    });
  }

  loadLogin() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    setState(() {
      isFirstIntro = sf.getBool('first') ?? false;
      sf.setBool('first', isFirstIntro);
    });
  }

  divertSceen() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    Timer.periodic(Duration(seconds: 3), (timer) {
      sf.setBool('first', isFirstIntro);
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: const [
            FlutterLogo(
              size: 150,
            ),
            Text("Soon you`ll be navigates..."),
          ],
        ),
      ),
    );
  }
}
