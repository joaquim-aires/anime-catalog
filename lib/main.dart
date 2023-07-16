import 'package:anime_list/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Animelist());
}

class Animelist extends StatelessWidget {
  Animelist({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
