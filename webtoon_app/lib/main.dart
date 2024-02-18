import 'package:flutter/material.dart';
import 'package:webtoon_app/screens/home_screen.dart';
import 'package:webtoon_app/services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // identifier role like an ID

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
