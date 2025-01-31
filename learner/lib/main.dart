import 'package:flutter/material.dart';
import 'package:learner/pages/dash/dash.dart';
import 'package:learner/pages/home/home.dart';
import 'package:learner/splash_screen/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) =>const SplashScreen(),
        '/home': (context) => const Home(),
        "/dash": (context) => const Dash(),
      }));
}
