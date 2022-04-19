import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pkmn_projct/screens/about_page.dart';
import 'package:pkmn_projct/screens/favorites_screen.dart';
import 'package:pkmn_projct/screens/my_home_page.dart';

class MyBottomBar extends StatefulWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MyHomePage(title: "teste")));
            break;
          case 1:
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesScreen()));
            break;
          case 2:
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutPage()));
            break;
          default:
        }
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Sobre',
        ),
      ],
      currentIndex: _currentIndex,
      selectedItemColor: HexColor("#0D0D0D"),
      backgroundColor: HexColor("#F2F2F2"),
      elevation: 0,
    );
  }
}
