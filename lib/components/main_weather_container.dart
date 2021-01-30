import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class MainWeatherContainer extends StatelessWidget {
  MainWeatherContainer(
      {@required this.city,
      @required this.date,
      @required this.label,
      @required this.humidity,
      @required this.tempMax,
      @required this.weatherImagePath,
      @required this.windSpeed,
      @required this.temp});
  final String city;
  final String date;
  final String weatherImagePath;
  final String label;
  final int windSpeed;
  final int humidity;
  final int tempMax;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        margin: EdgeInsets.all(22),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [Color(0xff040404), Color(0xff282627)]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text(city), Text(date)]),
            Image.asset(
              '$weatherImagePath',
              width: 200,
            ),
            SizedBox(height: 7),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Color(0xff949494),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Icon(
                      SFSymbols.wind,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$windSpeed km/h',
                      style: TextStyle(fontSize: 15),
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Icon(
                      SFSymbols.drop,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '$humidity %',
                      style: TextStyle(fontSize: 15),
                    )
                  ]),
                  SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    Icon(
                      SFSymbols.sun_min,
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'max $tempMax\u00B0 ',
                      style: TextStyle(fontSize: 15),
                    )
                  ]),
                ],
              ),
              Text('$temp\u00B0',
                  style: TextStyle(fontSize: 90, fontWeight: FontWeight.w200)),
            ]),
          ],
        ),
      ),
    );
  }
}
