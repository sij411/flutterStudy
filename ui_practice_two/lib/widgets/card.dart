import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String event, startMonth, startDay, endMonth, endDay;
  final List<String> members;
  final Color color;

  const EventCard({
    super.key,
    required this.event,
    required this.startMonth,
    required this.startDay,
    required this.endMonth,
    required this.endDay,
    required this.members,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(35),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "11",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "30",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.1),
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        height: 1.1,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    Text(
                      "12",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      event,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 55,
                          fontWeight: FontWeight.w500,
                          height: 0.8),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  members[members.length - 1],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 13),
                ),
                Text(
                  members[members.length - 2],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 13),
                ),
                Text(
                  members[members.length - 3],
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 13),
                ),
                SizedBox(
                  width: 30,
                  child: members.length > 3
                      ? Text(
                          "+${members.length - 3}",
                          style: const TextStyle(color: Colors.black),
                        )
                      : const Text(''),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
