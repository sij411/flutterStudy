import 'dart:developer';

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
  int semiSelectOrder = 0;
  int finalSelectOrder = 0;
  final List<String> quarterFinals = [
    "🇹🇯", // Indonesia
    "🇯🇴", // Jordan
    "🇦🇺", // Austrailia
    "🇰🇷", // Korea
    "🇯🇵", // Japan
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
                        onTap: () {
                          setState(() {
                            if (!semiFinals.contains(quarterFinals[index])) {
                              semiFinals[semiSelectOrder] =
                                  quarterFinals[index];
                              semiSelectOrder < 3
                                  ? semiSelectOrder++
                                  : semiSelectOrder;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      2,
                      (index) => SquareItem(
                        label: semiFinals[index],
                        onTap: () {
                          setState(() {
                            finals[finalSelectOrder] = semiFinals[index];
                            finalSelectOrder < 1
                                ? finalSelectOrder++
                                : finalSelectOrder;
                          });
                        },
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: [
                      SquareItem(
                          label: finals[0],
                          onTap: () {
                            setState(() {
                              if (winner.isEmpty) {
                                winner = finals[0];
                              }
                            });
                          }),
                    ],
                  ),
                  SquareColumn(
                    children: [
                      SquareItem(
                          label: finals[1],
                          onTap: () {
                            setState(() {
                              if (winner.isEmpty) {
                                winner = finals[1];
                              }
                            });
                          }),
                    ],
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      2,
                      (index) => SquareItem(
                        label: semiFinals[index + 2],
                        onTap: () {
                          setState(() {
                            finals[finalSelectOrder] = semiFinals[index + 2];
                            finalSelectOrder < 1
                                ? finalSelectOrder++
                                : finalSelectOrder;
                          });
                        },
                      ),
                    ),
                  ),
                  SquareColumn(
                    children: List<SquareItem>.generate(
                      4,
                      (index) => SquareItem(
                        label: quarterFinals[index + 4],
                        onTap: () {
                          setState(() {
                            semiFinals[semiSelectOrder] =
                                quarterFinals[index + 4];
                            semiSelectOrder < 3
                                ? semiSelectOrder++
                                : semiSelectOrder;
                          });
                        },
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
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("확인"),
                    ),
                  ],
                ),
              );
            }
          : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1.0,
            color: Colors.black,
          ),
        ),
        width: 50.0,
        height: 50.0,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
