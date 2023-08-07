import 'package:anime_list/anime_model.dart';
import 'package:flutter/material.dart';
import 'widgets/ContainerDetails.dart';

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
        body: DetailsContainer(image: widget.detailsAnime.image, synopsis: widget.detailsAnime.synopsis,)
        
        );
  }
}
