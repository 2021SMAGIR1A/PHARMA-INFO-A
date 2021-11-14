import 'package:e_pharm_mobile/vues/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'E-PHARM',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: AppBarTheme(elevation: 0),
      primarySwatch: Colors.green,
    ),
    home: SplashScreen(),
  ));
}
