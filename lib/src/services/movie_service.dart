import 'package:flutter_movie_api/src/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'dart:convert';

class MovieService {
  MovieService();

  final String _authority = "imdb-top-100-movies.p.rapidapi.com";

  Future<List<Movie>?> getContent() async {
    try {
      List<Movie> result = [];

      var url = Uri.https(_authority);
      var response = await http.get(url, headers: {
        'X-RapidAPI-Key': '3ab7519cfcmsh567850005475518p17887ajsnd3dde13308e6',
        'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
      });

      developer.log(
          "Status Code: ${response.statusCode.toString()}"); //usado para ver el estado de conexion

      List<dynamic> list = json.decode(response.body);
      for (var item in list) {
        Movie a = Movie.fromJson(item);
        result.add(a);
      }

      return result;
    } catch (ex) {
      developer.log(ex.toString());
      return null;
    }
  }
}
