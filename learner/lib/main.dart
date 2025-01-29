import 'package:flutter/material.dart';
import 'package:learner/pages/home.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
      }));
}
