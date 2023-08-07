import 'package:flutter/material.dart';
import 'package:anime_list/debouncer.dart';
import 'future_builder_list.dart';


class CenterContainerHomePage extends StatefulWidget {
  const CenterContainerHomePage({super.key});



   

  @override
  State<CenterContainerHomePage> createState() => _CenterContainerHomePageState();
}

class _CenterContainerHomePageState extends State<CenterContainerHomePage> {
final debouncer = Debouncer(milliseconds: 1000);
  dynamic search = '';
  
  
  void debounceSearch(String text) {
    setState(() {
      search = text;
    });
  }

  TextEditingController controler = TextEditingController();

 


  @override
  Widget build(BuildContext context) {
    return Center(
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
                          debouncer.call(() => debounceSearch(value));
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
                          hintText: 'search for an anime',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    FutureBuilderList(search: search, controler: controler),
                  ],
                ),
              ));
  }
}