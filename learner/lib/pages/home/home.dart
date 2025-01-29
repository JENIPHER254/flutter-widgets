import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Image(
            image: AssetImage(
              "assets/images/background/bg1.jpg",
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.45,
            fit: BoxFit.cover,
          ),
        )
      ],
    ));
  }
}
