import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const FortuneTeller(),
    );
  }
}

class FortuneTeller extends StatefulWidget {
  const FortuneTeller({super.key});

  @override
  State<FortuneTeller> createState() => _FortuneTellerState();
}

class _FortuneTellerState extends State<FortuneTeller> {
  int randomNum = 0;
  String imagePath = 'assets/images/luck-001.png';
  String fortuneText = "";

  void readFortuneData() async {
    String data = await rootBundle.loadString('assets/cleansed_luck_data.txt');
    List<String> lines = data.split('\n');

    setState(() {
      randomNum = Random().nextInt(30);
      fortuneText = lines[randomNum];
      int imageNum = randomNum + 1;
      var imageFileNum = imageNum < 10 ? '0' + imageNum.toString() : imageNum;
      imagePath = 'assets/images/luck-0$imageFileNum.png';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('오늘의 운세'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  readFortuneData();
                },
                child: Text('오늘의 운세 확인하기')),
            const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            Text(fortuneText),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),
            AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                imagePath,
                width: 100.0,
                height: 100.0,
                fit: BoxFit.cover,
              ),
            )
          ]),
        ));
  }
}
