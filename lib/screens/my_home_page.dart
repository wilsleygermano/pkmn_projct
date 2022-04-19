import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pkmn_projct/components/my_appbar.dart';
import 'package:pkmn_projct/components/my_bottombar.dart';
import 'package:pkmn_projct/models/home_controller.dart';
import 'package:pkmn_projct/screens/pkm_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final controller = HomeController();

  @override
  void initState() {
    setState(() {
      controller.start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MyBottomBar(),
      backgroundColor: HexColor("#F2F2F2"),
      appBar: const MyAppBar(),
      body: FutureBuilder(
        future: controller.start(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemCount: controller.allpkmns.results.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => PkmInfo(
                            name: controller.allpkmns.results[index].name!)),
                      ),
                    );
                  },
                  splashColor: HexColor("#595959"),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 36, 8),
                      child: Text(
                        "${controller.allpkmns.results[index].name?.toUpperCase()}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily:
                              GoogleFonts.atkinsonHyperlegible().fontFamily,
                          fontSize: 18,
                          color: HexColor("#0D0D0D"),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    leading: Image.asset(
                        "lib/images/${controller.allpkmns.results[index].name}.png"),
                    contentPadding: EdgeInsets.symmetric(horizontal: 48),
                  ),
                );
              },
            );
          }
          if (snapshot.connectionState == ConnectionState.none) {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.white,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ElevatedButton(
                    child: const Text("Try again"),
                    onPressed: () {
                      setState(
                        () {
                          controller.start();
                        },
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.purple,
              strokeWidth: 8.0,
            ),
          );
        }),
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
