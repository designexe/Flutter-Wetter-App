import 'package:flutter/material.dart';
import 'package:wetter_app/components/bottom_Button.dart';
import 'package:wetter_app/components/main_weather_container.dart';
import 'package:wetter_app/components/smal_week_weather_container.dart';
import 'package:wetter_app/service/weather_data.dart';

class ResultPage extends StatefulWidget {
  ResultPage({this.locationWeather, this.locationForecast});
  final locationWeather;
  final locationForecast;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // Actual Weather
  String city;
  String weatherDesc;
  int conditionCode;
  int humidity;
  double windSpeed;
  double temperatur;
  String weatherImage;
  // Forecast Morgen
  double tempMorgen;
  String descMorgen;
  String morgenImage;
  // Forecast Übermorgen
  double utempMorgen;
  String udescMorgen;
  String umorgenImage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather, widget.locationForecast);
  }

  void updateUI(dynamic weatherData, dynamic foreCastData) {
    if (weatherData == 0) {
      city = 'EROOR';
      weatherDesc = 'EROOR';
      conditionCode = 0;
      humidity = 0;
      windSpeed = 0;
      temperatur = 0;
      return;
    } else {
      city = weatherData['name'];
      weatherDesc = weatherData['weather'][0]['description'];
      conditionCode = weatherData['weather'][0]['id'];
      humidity = weatherData['main']['humidity'];
      windSpeed = weatherData['wind']['speed'];
      temperatur = weatherData['main']['temp'];
      weatherImage = WeatherData.getWeahterImage(conditionCode);
    }
    if (foreCastData == 0) {
      tempMorgen = 0;
      descMorgen = 'ERROR';
      morgenImage = 'cloud.png';
      utempMorgen = 0;
      udescMorgen = 'EROOR';
      umorgenImage = 'cloud.png';
      return;
    } else {
      // Forecast Data Morgen
      tempMorgen = foreCastData['daily'][1]['temp']['day'];
      descMorgen = foreCastData['daily'][1]['weather'][0]['description'];
      var morgenConditionCode = foreCastData['daily'][1]['weather'][0]['id'];
      morgenImage = WeatherData.getWeahterImage(morgenConditionCode);
      // Forecast Data Übermorgen
      utempMorgen = foreCastData['daily'][2]['temp']['day'];
      udescMorgen = foreCastData['daily'][2]['weather'][0]['description'];
      var umorgenConditionCode = foreCastData['daily'][2]['weather'][0]['id'];
      umorgenImage = WeatherData.getWeahterImage(umorgenConditionCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wetter'),
      ),
      body: Column(
        children: [
          MainWeatherContainer(
            city: city,
            date: 'Heute',
            label: weatherDesc,
            humidity: humidity,
            tempMax: 3,
            temp: temperatur.toInt(),
            weatherImagePath: 'images/$weatherImage',
            windSpeed: windSpeed.toInt(),
          ),
          Row(
            children: [
              SmallWeekContainer(
                date: 'Morgen',
                label: descMorgen,
                temp: tempMorgen.toInt(),
                weatherImagePath: 'images/$morgenImage',
              ),
              SmallWeekContainer(
                date: 'Übermorgen',
                label: udescMorgen,
                temp: utempMorgen.toInt(),
                weatherImagePath: 'images/$umorgenImage',
              ),
            ],
          ),
          BottomButton(
            buttonText: 'STADT AUSWÄHLEN',
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
