import 'package:flutter/material.dart';
import 'package:webtoon_app/services/api_service.dart';

import '../models/webtoon_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<WebtoonModel> webtoons = [];
  bool isLoading = true;

  void waitForWebtoons() async {
    webtoons = await ApiService.getTodaysToons();
    isLoading = false;
    setState(() {}); // reload!
  }

  @override
  void initState() {
    //
    super.initState();
    waitForWebtoons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        elevation: 10,
        shadowColor: Colors.grey[300],
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
    );
  }
}
