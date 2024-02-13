import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final bool isToday;
  final String date;

  const Day({
    super.key,
    required this.isToday,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isToday ? 0 : 8,
        ),
        child: Text(
          date,
          style: TextStyle(
            color: isToday ? Colors.white : Colors.white.withOpacity(0.5),
            fontSize: 40,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
