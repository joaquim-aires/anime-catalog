import 'package:anime_list/debouncer.dart';
import 'package:anime_list/widgets/center_container_home_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final debouncer = Debouncer(milliseconds: 1000);
  dynamic search = '';
  void debounceSearch(String text) {
    setState(() {
      search = text;
    });
  }

  TextEditingController controler = TextEditingController();

  void refreshErro() {
    setState(() {
      search = controler.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Anime Catalog'),
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
                  ])),
              child: CenterContainerHomePage()
            )));
  }
}
