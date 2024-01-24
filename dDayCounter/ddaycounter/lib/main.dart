import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  int getDiff(String date) {
    DateTime date1 = DateTime.parse(date);
    DateTime date2 = DateTime.now();

    Duration difference = date2.difference(date1);

    print('Difference in days: ${difference.inDays}');
    return difference.inDays;
  }

  DateTime getAfterDays(String date) {
    DateTime startDate = DateTime.parse(date);

    DateTime endDate = startDate.add(Duration(days: 100));
    print('Start Date: $startDate');
    print('End Date after 100 days: $endDate');
    return endDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('디데이 카운터'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('플러터 앱으로 디데이 카운터 만들기'),
            const Text('기준년월일 (YYYYMMDD)'),
            // text form field
            TextFormField(
              maxLength: 8,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp('[0-9]'))
              ],
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter YYYYMMDD',
              ),
              controller: myController,
            ),

            // description
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

            // 기준일로부터의 날짜
            ElevatedButton(
                onPressed: () {
                  // diff
                  var dayPassed = getDiff(myController.text);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // TextEditingController.
                        content: Text("기준일로부터 $dayPassed일이 지났습니다."),
                      );
                    },
                  );
                },
                child: const Text("기준일로부터의 날짜 계산하기")),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            ElevatedButton(
                onPressed: () {
                  DateTime afterDays = getAfterDays(myController.text);
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // TextEditingController.
                        content: Text(
                            "기준일로부터 100일후는 ${afterDays.year}년 ${afterDays.month}월 ${afterDays.day}일 입니다."),
                      );
                    },
                  );
                },
                child: const Text("100일 후 날짜 계산하기")),
          ]),
        ));
  }
}
