import 'package:flutter/material.dart';
import 'package:anime_list/debouncer.dart';

class AnimeSearchBar extends StatefulWidget {
  final Function callback;
  final TextEditingController controler;
  const AnimeSearchBar({super.key, required this.callback, required this.controler});
  
  @override
  State<AnimeSearchBar> createState() => _AnimeSearchBarState();
}

class _AnimeSearchBarState extends State<AnimeSearchBar> {
final debouncer = Debouncer(milliseconds: 1000);




  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0)),
      height: 55,
      child: TextField(
        controller: widget.controler,
        onChanged: (value) {
          debouncer.call(() => widget.callback(value));
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
