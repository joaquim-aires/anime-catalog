import 'package:flutter/material.dart';
import 'package:anime_list/debouncer.dart';

class AnimeSearchBar extends StatefulWidget {
  dynamic search;
  final TextEditingController controler;
  AnimeSearchBar({super.key, required this.search, required this.controler});
  final debouncer = Debouncer(milliseconds: 1000);
  @override
  State<AnimeSearchBar> createState() => _AnimeSearchBarState();
}

class _AnimeSearchBarState extends State<AnimeSearchBar> {


  void debounceSearch(String text) {
    print(text);
    setState(() {
      widget.search = text;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0)),
      height: 55,
      child: TextField(
        controller: widget.controler,
        onChanged: (value) {
          widget.debouncer.call(() => debounceSearch(value));
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
    );
  }
}
