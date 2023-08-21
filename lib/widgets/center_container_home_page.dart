import 'package:anime_list/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:anime_list/debouncer.dart';
import 'future_builder_list.dart';

class CenterContainerHomePage extends StatefulWidget {
  const CenterContainerHomePage({super.key});

  @override
  State<CenterContainerHomePage> createState() =>
      _CenterContainerHomePageState();
}

class _CenterContainerHomePageState extends State<CenterContainerHomePage> {
  final debouncer = Debouncer(milliseconds: 1000);
  dynamic search = '';
  TextEditingController controler = TextEditingController();

  void debounceSearch(String text) {
    setState(() {
      search = text;
    });
  }


  

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(1.0),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        children: [
          AnimeSearchBar(callback: debounceSearch, controler: controler),
          FutureBuilderList(search: search, controler: controler),
        ],
      ),
    ));
  }
}
