import 'package:anime_list/anime_model.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.detailsAnime});
  final AnimeModel detailsAnime;

  @override
  State<DetailsPage> createState() => _HomePageState();
}

class _HomePageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 63, 62, 62),
        appBar: AppBar(
            title: Text(widget.detailsAnime.name),
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 13, 35, 86)),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 34, 65, 135),
                  Color.fromARGB(255, 13, 35, 86)
                ]),
          ),
          child: ListView(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(widget.detailsAnime.image,
                      fit: BoxFit.cover)),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Synopsis',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.detailsAnime.synopsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
