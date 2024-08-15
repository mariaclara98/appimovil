import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/models/movie_model.dart';
import 'package:flutter_movie_api/src/screens/movie_page.dart';

class SearchMovie extends StatefulWidget {
  final List<Movie> movieList;

  const SearchMovie({super.key, required this.movieList});

  @override
  State<SearchMovie> createState() => _SearchMovieState();
}

class _SearchMovieState extends State<SearchMovie> {
  String _movieFilter = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filteredData = _movieFilter.isEmpty
        ? widget.movieList
        : widget.movieList.where((item) {
            final movie = item;
            return movie.title
                    .toLowerCase()
                    .contains(_movieFilter.toLowerCase()) ||
                movie.title.toLowerCase().contains(
                      _movieFilter.toLowerCase(),
                    );
          }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _movieFilter = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Buscar por ciudad o nombre',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: filteredData.isEmpty == true
                ? const Center(child: Text("No hay datos"))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: filteredData.length,
                    itemBuilder: (context, index) {
                      Movie movie = filteredData[index];
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
                  ),
          )
        ],
      ),
    );
  }
}
