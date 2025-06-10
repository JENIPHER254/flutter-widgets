import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LearnFlutter extends StatefulWidget {
  const LearnFlutter({Key? key}) : super(key: key);

  @override
  _LearnFlutterState createState() => _LearnFlutterState();
}

class _LearnFlutterState extends State<LearnFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FadeInUp(
              duration: const Duration(milliseconds: 1500),
              child: Image(
                image: AssetImage(
                  "assets/images/african/2.jpg",
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.45,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInUp(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      "Learning code is now more easy",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 36, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    delay: const Duration(milliseconds: 1200),
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      "Are you ready to learn languages \neasily in the funniest way?",
                      style: GoogleFonts.robotoSlab(
                          fontSize: 16,
                          height: 1.8,
                          color: Colors.grey.shade700),
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 1000),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        color: Colors.black,
                        height: 45,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, bottom: 4),
                        child: Center(
                          child: Text(
                            "Get Started",
                            style: GoogleFonts.robotoSlab(
                                fontSize: 16, color: Colors.white),
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "SKIP",
                          style: GoogleFonts.robotoSlab(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              height: 1.8,
                              color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
