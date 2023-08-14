import 'package:flutter/material.dart';

class DetailsListView extends StatefulWidget {
  final String image;
  final String synopsis;
  const DetailsListView({super.key, required this.image, required this.synopsis});

  @override
  State<DetailsListView> createState() => _DetailsListViewState();
}

class _DetailsListViewState extends State<DetailsListView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(widget.image,
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
                  widget.synopsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
  }
}