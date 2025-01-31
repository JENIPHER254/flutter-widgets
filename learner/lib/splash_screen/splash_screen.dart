import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  //  declaring animation variables
  late AnimationController _controller;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 4300), () {
      Navigator.pushReplacementNamed(context, "/home");
    });

    // initializing animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2700),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    //define animation logo size
    _animation = Tween<double>(begin: 100, end: logoSize)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }
  }

  double logoSize = 300;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.2),
              child: Text(
                "Stories From the Heart of...",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Caveat", fontSize: 30),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Image(
                  image: AssetImage("assets/logo/img7.jpg"),
                  width: _animation.value,
                  height: _animation.value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
