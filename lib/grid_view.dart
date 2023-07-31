import 'package:flutter/material.dart';
import 'details_page.dart';

class GridViewGenerator extends StatefulWidget {
  const GridViewGenerator({super.key, required this.animeData});
  final List<dynamic> animeData;
  @override
  State<GridViewGenerator> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GridViewGenerator> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.animeData.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.55),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(detailsAnime: widget.animeData[index]),
              ),
            );
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                      image: NetworkImage(widget.animeData[index].image),
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
                        widget.animeData[index].name,
                        style: const TextStyle(
                            fontSize: 18, overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ),
              )),
        );
      },
    );
  }
}
