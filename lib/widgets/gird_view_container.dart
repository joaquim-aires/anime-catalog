import 'package:flutter/material.dart';

class GridViewContainer extends StatefulWidget {
  
  final String image;
  final String name;
  const GridViewContainer({super.key, required this.image, required this.name});

  @override
  State<GridViewContainer> createState() => _GridViewContainerState();
}

class _GridViewContainerState extends State<GridViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8.0),
                          bottomRight: Radius.circular(8.0)),
                      color: Colors.white),
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                            fontSize: 18, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ),
              ));
  }
}