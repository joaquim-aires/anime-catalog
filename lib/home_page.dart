import 'package:flutter/material.dart';
import 'apiResult.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color.fromARGB(255, 241, 225, 225),
            appBar: AppBar(
                title: Text('Lista de Animes'),
                centerTitle: true,
                backgroundColor: Color.fromARGB(255, 5, 36, 27)),
            body: Center(
                child: Padding(
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder<List>(
                future: apiResult().getAnimes(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Erro ao carregar os dados'),
                    );
                  }
                  if (snapshot.hasData) {
                    var animeData = snapshot.data!;
                    return GridView.builder(
                      itemCount: animeData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                image: DecorationImage(
                                    image: NetworkImage(animeData[index].image),
                                    fit: BoxFit.cover)),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                animeData[index].name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    backgroundColor: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ));
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ))));
  }
}
