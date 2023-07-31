import 'package:anime_list/debouncer.dart';
import 'package:anime_list/grid_view.dart';
import 'package:flutter/material.dart';
import 'api_result.dart';

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
                title: const Text('Anime Calalog'),
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
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      height: 55,
                      child: TextField(
                        controller: controler,
                        onChanged: (value) {
                          debouncer(() => debounceSearch(value));
                        },
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 135, 167))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 121, 135, 167))),
                          contentPadding: EdgeInsets.all(12),
                          filled: true,
                          fillColor: Color.fromARGB(255, 32, 55, 109),
                          hintText: 'search fo an anime',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    FutureBuilder<List>(
                      future: ApiResult().getAnimes(search),
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            height: 750,
                            decoration: const BoxDecoration(),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        if (snapshot.hasData) {
                          var animeData = snapshot.data!;

                          return GridViewGenerator(animeData: animeData);
                        }

                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ],
                ),
              )),
            )));
  }
}
