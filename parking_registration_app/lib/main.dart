import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void showErrorDialog(bool isRegistered) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text("주차 관리 앱"),
              content: Text(
                isRegistered ? "이미 등록된 차량번호입니다." : "주차 등록을 하지 않으셨습니다.",
              ),
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
      appBar: AppBar(title: const Text("주차 관리 앱")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showErrorDialog(true);
              },
              child: const Text("차량번호 등록"),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
            ElevatedButton(
              onPressed: () {
                showErrorDialog(false);
              },
              child: const Text("주차요금 정산"),
            ),
          ],
        ),
      ),
    );
  }
}
