import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pkmn_projct/components/my_appbar.dart';
import 'package:pkmn_projct/components/my_bottombar.dart';
import 'package:pkmn_projct/data/fetch_pkm_info.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

var pkmnFavoritesBox = Hive.box('favorite_pkmns');

class PkmInfo extends StatefulWidget {
  final String name;
  final String? pkmnAvatar;
  final String? pkmnHeight;
  final int? pkmnId;

  const PkmInfo(
      {required this.name,
      Key? key,
      this.pkmnAvatar,
      this.pkmnHeight,
      this.pkmnId})
      : super(key: key);

  @override
  State<PkmInfo> createState() => _PkmInfoState();
}

class _PkmInfoState extends State<PkmInfo> {
  bool toggle = false;
  bool loading = false;
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchPkmnInfo(widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backbttn: BackButton(
          color: HexColor("#0D0D0D"),
        ),
      ),
      backgroundColor: HexColor("#F2F2F2"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              color: HexColor("#F2F2F2"),
                              child: Text(
                                widget.name.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: HexColor("#0D0D0D"),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            IconButton(
                              icon: toggle
                                  ? const Icon(Icons.favorite)
                                  : const Icon(Icons.favorite_border),
                              onPressed: () async {
                                setState(() {
                                  toggle = !toggle;
                                });
                                if (toggle = true) {
                                  await pkmnFavoritesBox.add(
                                      widget.name);
                                  print(pkmnFavoritesBox.values);
                                }
                                await pkmnFavoritesBox
                                    .delete("id${widget.pkmnId}");
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                8,
                                24,
                                0,
                                0,
                              ),
                              child: SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.network(snapshot.data!.sprites),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            24,
                            0,
                            0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 1,
                                width: 360,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            0,
                            24,
                            0,
                            0,
                          ),
                          child: Card(
                            color: HexColor("#DBDBDB"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            shadowColor: HexColor('#F2F2F2'),
                            child: Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 64,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "TYPE",
                                          style: TextStyle(
                                            fontFamily: GoogleFonts
                                                    .atkinsonHyperlegible()
                                                .fontFamily,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data!.types.toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: GoogleFonts
                                                    .atkinsonHyperlegible()
                                                .fontFamily,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 48,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "HEIGHT",
                                          style: TextStyle(
                                            fontFamily: GoogleFonts
                                                    .atkinsonHyperlegible()
                                                .fontFamily,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${snapshot.data!.height.toString()}0 cm",
                                          style: TextStyle(
                                            fontFamily: GoogleFonts
                                                    .atkinsonHyperlegible()
                                                .fontFamily,
                                            fontSize: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.purple,
                    strokeWidth: 8.0,
                  ));
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
