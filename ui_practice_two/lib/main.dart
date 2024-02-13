import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_practice_two/widgets/card.dart';
import 'package:ui_practice_two/widgets/day.dart';

void main() {
  runApp(const MyApp());
}

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
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                              scale: 1,
                              "https://i.pinimg.com/564x/dc/a9/86/dca9868d358ef0d628d9030b5e3d11de.jpg",
                            )),
                        Text(
                          "+",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w700),
                        )
                      ]),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "MONDAY 16",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Day(isToday: true, date: "TODAY"),
                                Icon(
                                  Icons.circle,
                                  color: Colors.red,
                                  size: 10,
                                ),
                              ],
                            ),
                            Day(isToday: false, date: "17"),
                            Day(isToday: false, date: "18"),
                            Day(isToday: false, date: "19"),
                            Day(isToday: false, date: "20"),
                            Day(isToday: false, date: "21"),
                            Day(isToday: false, date: "22"),
                            Day(isToday: false, date: "23"),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  EventCard(
                    event: 'DESIGN\nMEETING',
                    startMonth: "11",
                    startDay: "30",
                    endMonth: "12",
                    endDay: "30",
                    members: [
                      "NANA",
                      "HELENA",
                      "ALEX",
                    ],
                    color: Color(0xFFFEF754),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EventCard(
                    event: 'DAILY\nPROJECT',
                    startMonth: "12",
                    startDay: "35",
                    endMonth: "14",
                    endDay: "10",
                    members: [
                      "CHARLE",
                      "NANA",
                      "CHARLE",
                      "NANA",
                      "CIRY",
                      "RICHARD",
                      "ME"
                    ],
                    color: Color(0xFF9C6BCE),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EventCard(
                    event: 'WEEKLY\nPLANNING',
                    startMonth: "15",
                    startDay: "00",
                    endMonth: "16",
                    endDay: "30",
                    members: [
                      "MARK",
                      "NANA",
                      "DEN",
                    ],
                    color: Color(0xfffbbee4b),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EventCard(
                    event: 'DAILY\nPROJECT',
                    startMonth: "12",
                    startDay: "35",
                    endMonth: "14",
                    endDay: "10",
                    members: [
                      "CHARLE",
                      "NANA",
                      "CHARLE",
                      "NANA",
                      "CIRY",
                      "RICHARD",
                      "ME"
                    ],
                    color: Color(0xFF9C6BCE),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
