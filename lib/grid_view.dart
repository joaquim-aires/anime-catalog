import 'package:flutter/material.dart';
import 'details_page.dart';
import 'widgets/gird_view_container.dart';

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
          child: GridViewContainer(image: widget.animeData[index].image, name:widget.animeData[index].name)
        );
      },
    );
  }
}
