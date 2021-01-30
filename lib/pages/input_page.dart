import 'package:flutter/material.dart';
import 'package:wetter_app/pages/result_page.dart';
import 'package:wetter_app/service/weather_data.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double lat;
  double lon;
  String cityName;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    var weatherData = await WeatherData().getLocationWeather();
    var weatherForecast = await WeatherData().getLocationForecast();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ResultPage(
        locationForecast: weatherForecast,
        locationWeather: weatherData,
      );
    }));
  }

  Future<void> getCitynData() async {
    var weatherData = await WeatherData().getCityWeather(city: cityName);
    var weatherForecast = await WeatherData().getCityForecast(cityName);

    print(weatherForecast);

    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return ResultPage(
    //     locationForecast: weatherForecast,
    //     locationWeather: weatherData,
    //   );
    // }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1D1C1C),
        appBar: AppBar(
          title: Text('Wetter'),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  cityName = value;
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  icon: Icon(
                    Icons.location_city,
                    color: Colors.white,
                  ),
                  hintText: 'Standt eingeben!',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  getCitynData();
                });
              },
              child: Text('Wetter anzeigen'),
            ),
          ],
        ));
  }
}
