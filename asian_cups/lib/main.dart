import 'package:flutter/material.dart';

void main() {
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
   @override
 Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
 }
}

class HomeScreen extends StatefulWidget {
   @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final List<String> quarterFinals = [
    "🇹🇯",
    "🇯🇴",
    "🇦🇺",
    "🇰🇷",
    "🇯🇵",
    "🇮🇷",
    "🇺🇿",
    "🇶🇦"
 ];
 List<String> semiFinals = ["", "", "", ""];
 List<String> finals = ["", ""];
 String winner = "";

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2023 아시안컵 카타르"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "우승팀: $winner",
              style: const TextStyle(
                fontSize: 30.0,
              ),
            ),
            Container(
              color: Colors.yellow,
              width: MediaQuery.of(context).size.width,
              height: 300.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      4,
                      (index) => SquareItem(
                        label: quarterFinals[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      2,
                      (index) => SquareItem(
                        label: semiFinals[index],
                        onTap: () {},
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: [
                      SquareItem(label: finals[0], onTap: () {}),
                    ],
                  ),
                  SquareColumn(
                    children: [
                      SquareItem(label: finals[1], onTap: () {}),
                    ],
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      2,
                      (index) => SquareItem(
                        label: semiFinals[index + 2],
                        onTap: () {},
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      4,
                      (index) => SquareItem(
                        label: quarterFinals[index + 4],
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }
}

class SquareColumn extends StatelessWidget {
   final List<Widget> children;
 const SquareColumn({required this.children, super.key});

 @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: children,
    );
 }
}

class SquareItem extends StatelessWidget {
   final String label;
 final VoidCallback onTap;
 const SquareItem({required this.label, required this.onTap, super.key});

 @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: label.isEmpty
          ? () {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text(
                    "오류",
                  ),
                  content: const Text(
                    "선택된 팀이 없습니다.",
   

