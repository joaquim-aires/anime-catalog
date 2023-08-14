import 'package:flutter/material.dart';

class DetailsPageDecoration extends StatefulWidget {
  const DetailsPageDecoration({super.key});

  @override
  State<DetailsPageDecoration> createState() => _DetailsPageDecorationState();
}

class _DetailsPageDecorationState extends State<DetailsPageDecoration> {
  @override
  Widget build(BuildContext context) {
    return   Container (
             decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 34, 65, 135),
                  Color.fromARGB(255, 13, 35, 86)
                ]),
          ));
  }
}