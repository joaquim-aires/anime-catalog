import 'package:flutter/material.dart';
import 'package:anime_list/api_result.dart';
import 'package:anime_list/grid_view.dart';
import 'process_indicator.dart';

class FutureBuilderList extends StatefulWidget {
  dynamic search;
  final TextEditingController controler;
  
  

  FutureBuilderList({super.key, required this.search, required this.controler});

  @override
  State<FutureBuilderList> createState() => _FutureBilderListState();
}

class _FutureBilderListState extends State<FutureBuilderList> {
  
  void refreshErro() {
    setState(() {
      widget.search = widget.controler.text;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      
      future: ApiResult().getAnimes(widget.search),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(
            height: 750,
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text('Network error',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        )),
                  ),
                  GestureDetector(
                    child: IconButton(
                      icon: const Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                      onPressed: refreshErro,
                      iconSize: 40,
                    ),
                  )
                ],
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProcessIndicator();
        }

        if (snapshot.hasData) {
          var animeData = snapshot.data!;

          return GridViewGenerator(animeData: animeData);
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
