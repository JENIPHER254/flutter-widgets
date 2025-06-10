import 'package:flutter/material.dart';
import 'package:learner/carousel/concentric.dart';
import 'package:learner/carousel/dream_job.dart';
import 'package:learner/carousel/learn_coding.dart';
import 'package:learner/carousel/slider.dart';
import 'package:learner/pages/dash/dash.dart';
import 'package:learner/pages/home/home.dart';
import 'package:learner/splash_screen/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        "/dash": (context) => const Dash(),
        "/dash2": (context) => const LearnFlutter(),
        "/carousel": (context) => const Carousel(),
        "/dream_job": (context) => const DreamJob(),
        "/transition": (context) => const ConcentricTransition(),
      }));
}
