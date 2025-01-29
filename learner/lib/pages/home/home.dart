import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var target = 12;
  var count = 0;
  double turns = 0.0;
  bool isClicked = false;

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
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Text(
              "Tales and Stories from the Heart of Africa",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Caveat",
                fontSize: 30,
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            "Tap" + target.toString() + " times to Unlock",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Caveat",
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        AnimatedRotation(
          curve: Curves.easeOutExpo,
          turns: turns,
          duration: Duration(seconds: 2),
          child: GestureDetector(
            onTap: () {
              if (isClicked) {
                setState(() {
                  turns -= 3 / 4;
                  count++;
                });
              } else {
                setState(() {
                  turns += 2 / 4;
                  count++;
                });
              }
              isClicked = !isClicked;
              if (count == target) {
                Navigator.pushNamed(context, "/dash");
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  //bottom right shadow

                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.grey,
                    offset: Offset(20, 20),
                  ),
                  //top right shadow
                  BoxShadow(
                    blurRadius: 30,
                    color: Colors.grey,
                    offset: Offset(-20, -20),
                  ),
                ],
              ),
              child: SizedBox(
                height: 110,
                width: 110,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Story Time",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Caveat"),
                    ),
                    Text(count.toString())
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
