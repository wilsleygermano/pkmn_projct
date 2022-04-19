import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../components/my_appbar.dart';
import '../components/my_bottombar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomBar(),
      backgroundColor: HexColor("#F2F2F2"),
      appBar: const MyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: HexColor("#DBDBDB"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            shadowColor: HexColor('#F2F2F2'),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    SizedBox(
                      height: 600,
                      child: Column(
                        children: [
                          Text(
                            "Desenvolvido, com lágrimas (e ajuda do Pedro), por Wil!"
                                .toUpperCase(),
                            style: TextStyle(
                              fontFamily:
                                  GoogleFonts.atkinsonHyperlegible().fontFamily,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Image.network(
                            "https://c.tenor.com/x36w4wZx1JcAAAAC/pikachu-sadness.gif",
                            height: 360,
                            width: 360,
                          ),
                          Image.asset(
                            'lib/images/fracasso.png',
                            height: 200,
                            width: 200,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
