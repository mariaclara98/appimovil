import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/models/movie_model.dart';
import 'package:flutter_movie_api/src/screens/movie_page.dart';

class ListHtppJson extends StatefulWidget {
  final List<Movie> movieList;

  const ListHtppJson({super.key, required this.movieList});

  @override
  State<ListHtppJson> createState() => _ListHtppJsonState();
}

class _ListHtppJsonState extends State<ListHtppJson> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.movieList.isEmpty
        ? const Center(child: Text("No hay datos"))
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.movieList.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              Movie movie = widget.movieList[index];
              return Card(
                  child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MoviePage(movie: movie)),
                  );
                },
                title: Text(movie.title),
                subtitle: Text("Fecha de estreno: ${movie.year}"),
                leading: Text(movie.id.toUpperCase()),
                trailing: Image.network(
                  movie.image,
                  width: 50.0, // Ajusta el ancho
                  height: 50.0, // Ajusta la altura
                  fit: BoxFit.cover, // Ajusta la forma de la imagen
                ),
              ));
            },
          );
  }
}
