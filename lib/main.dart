import 'package:flutter/material.dart';
import 'package:amine_elhoussaini/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child as Widget,
        );
      },*/
      title: 'عبد الرزاق المونفالوطي',
      theme: ThemeData(
        fontFamily: 'Almarai',
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
