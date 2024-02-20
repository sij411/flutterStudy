import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie_model.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getPopularMovies() async {
    final url = Uri.parse('$baseUrl/$popular');
    List<MovieModel> movieInstances = [];

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> movies = jsonDecode(response.body);

      for (var movie in movies['results']) {
        movieInstances.add(MovieModel.fromJson(movie));
        print(movie);
      }

      return movieInstances;
    }
    throw Error();
  }
}
