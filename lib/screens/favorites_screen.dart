import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pkmn_projct/models/home_controller.dart';
import 'package:pkmn_projct/screens/pkm_info.dart';
import '../components/my_appbar.dart';
import '../components/my_bottombar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final controller = HomeController();
  final pkmnBox = Hive.box('favorite_pkmns');
  final List pkmnBoxNames = pkmnFavoritesBox.values.toList();

  @override
  void initState() {
    setState(() {
      controller.start();
      pkmnBox;
      pkmnBoxNames;
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
                itemCount: pkmnBoxNames.length,
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
                          "${controller.allpkmns.results[pkmnFavoritesBox.values.length].name?.toUpperCase()}",
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
                      leading: Image.asset("lib/images/${controller.allpkmns.results[pkmnFavoritesBox.values.length].name}.png"),
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
                          borderRadius: BorderRadius.circular(16)),
                      child: ElevatedButton(
                        child: const Text("Try again"),
                        onPressed: () {
                          setState(() {
                            controller.start();
                          });
                        },
                      ),
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
                strokeWidth: 8.0,
              ),
            );
          }),
        ));
  }
}
