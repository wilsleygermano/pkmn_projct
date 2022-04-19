import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/my_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(pkmnbox);
  runApp(const MyApp());
}

const pkmnbox = 'favorite_pkmns';
