import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:pkmn_projct/screens/pkm_info.dart';
import '../screens/my_home_page.dart';

class PkmnApp extends StatelessWidget {
  const PkmnApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: HexColor("#F2F2F2"),
      ),
      home: const MyHomePage(
        title: "teste",
      ),
    );
  }
}
