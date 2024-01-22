import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showResultDialog() {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("가위바위보 게임"),
              content: const Text("사용자는 {가위}, 컴퓨터는 {바위}를 냈습니다.\n컴퓨터의 승리입니다."),
              actions: [
                TextButton(
                  child: const Text("확인"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("가위바위보 게임")),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(onPressed: showResultDialog, child: const Text("가위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(onPressed: showResultDialog, child: const Text("바위")),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
          ElevatedButton(onPressed: showResultDialog, child: const Text("보")),
        ]),
      ),
    );
  }
}