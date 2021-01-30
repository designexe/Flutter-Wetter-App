import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class SmallWeekContainer extends StatelessWidget {
  SmallWeekContainer(
      {@required this.date,
      @required this.label,
      @required this.weatherImagePath,
      @required this.temp});

  final String date;
  final String weatherImagePath;
  final String label;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff040404), Color(0xff282627)]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(date),
            Image.asset(
              '$weatherImagePath',
              width: 50,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xff949494),
              ),
            ),
            Text('$temp\u00B0',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200)),
          ],
        ),
      ),
    );
  }
}
