import 'package:flutter/material.dart';
import 'package:learner/pages/dash/dash.dart';
import 'package:learner/pages/home/home.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        "/dash": (context) => const Dash(),
      }));
}
