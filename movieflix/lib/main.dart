import 'package:flutter/material.dart';
import 'package:movieflix/services/api_services.dart';

import 'screens/home_screen.dart';

void main() {
  ApiService.getPopularMovies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // identifier role like an ID

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
