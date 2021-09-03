import 'package:flutter/material.dart';
import 'package:amine_elhoussaini/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);

    controller.forward().then((_) {
      navigationPage();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void navigationPage() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => MyHomePage(title: 'عبد الرزاق المونفالوطي')));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(
              image: AssetImage("assets/Layer.png"), fit: BoxFit.cover)),
      child: Center(
        child: ClipRRect(
          child: ClipOval(
            child: Image.asset(
              'assets/icone_monfalouti.png',
              height: 250,
            ),
          ),
        ),
      ),
    ));
  }
}
