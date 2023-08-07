import 'package:flutter/material.dart';
import 'package:anime_list/widgets/DetailsListView.dart';

class DetailsContainer extends StatefulWidget {
  final String image;
  final String synopsis;
  
  const DetailsContainer({super.key, required this.image, required this.synopsis });

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 34, 65, 135),
                  Color.fromARGB(255, 13, 35, 86)
                ]),
          ),
          child: DetailsListView(image: widget.image, synopsis: widget.synopsis)
        );
  }
}