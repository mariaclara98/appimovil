import 'package:flutter/material.dart';
import 'package:flutter_movie_api/src/models/movie_model.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: movie.image.isEmpty
                  ? SizedBox(
                      width: 100,
                      child: Image.asset("assets/images/poster.png"))
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Theme.of(context).colorScheme.surface,
                      child: Image.network(movie.bigImage)),
            ),
            Container(
              padding: const EdgeInsets.all(25.0),
              color: Theme.of(context).colorScheme.surface,
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      movie.title,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Text("Rating: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(movie.rating,
                            style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      children: [
                        Text("Fecha de Estreno: ",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text("${movie.year}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sinopsis:",
                            style: Theme.of(context).textTheme.labelLarge),
                        Text(
                          movie.description,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text("Género(/s): ",
                          style: Theme.of(context).textTheme.labelLarge),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: _showList(movie.genre, context),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showList(List<String> list, context) {
    return Wrap(
        children: list.map((text) {
      return Card(
          elevation: 5,
          color: Theme.of(context).cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ));
    }).toList());
  }
}
