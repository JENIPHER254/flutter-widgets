import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/drawer/drawer.dart';

class Dash extends StatelessWidget {
  const Dash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
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
                        "Immerse Yourself in African Narratives",
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
                        "Journey through diverse cultures and compelling stories from  across \n  the continent.",
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
                            Navigator.pushNamed(context, "/carousel");
                          },
                          color: Colors.black,
                          height: 45,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 4),
                          child: Center(
                            child: Text(
                              "New Arrivals",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 16, color: Colors.white),
                            ),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Explore Books",
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
      ),
    );
  }
}
