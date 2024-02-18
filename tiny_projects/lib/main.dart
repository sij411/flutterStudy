// 날짜를 선택하는 셀렉트박스 만들기

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF1F1F1F),
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          
        ));
  }
}
