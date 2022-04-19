import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key, this.backbttn}) : super(key: key);
  final Widget? backbttn;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backbttn,
      centerTitle: true,
      title: const Text(
        "POKÉ DEX",
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.atkinsonHyperlegible().fontFamily,
        fontSize: 24,
        color: HexColor("#0D0D0D"),
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(3.0, 3.0),
            blurRadius: 3.0,
            color: HexColor("#A6A6A6"),
          ),
        ],
      ),
      backgroundColor: HexColor("#F2F2F2"),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
