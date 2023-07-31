import 'package:anime_list/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Animelist());
}

class Animelist extends StatelessWidget {
  const Animelist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Anime Catalog',
        theme: ThemeData(useMaterial3: true),
        home: const HomePage());
  }
}
