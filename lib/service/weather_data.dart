import 'package:wetter_app/service/location.dart';
import 'package:wetter_app/service/networking.dart';

const apiKey = 'XXXXXXXXXX';

class WeatherData {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getMyLocation();

    Networker networker = Networker(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=${location.getLat()}&lon=${location.getLon()}&appid=$apiKey&units=metric&lang=de');
    var weatherData = await networker.getData();
    return weatherData;
  }

  Future<dynamic> getLocationForecast() async {
    Location location = Location();
    await location.getMyLocation();

    Networker networker = Networker(
        url:
            'https://api.openweathermap.org/data/2.5/onecall?lat=${location.getLat()}&lon=${location.getLon()}&appid=$apiKey&units=metric&lang=de');
    var forecastData = await networker.getData();
    return forecastData;
  }

  Future<dynamic> getCityWeather({String city}) async {
    Networker networker = Networker(
        url:
            'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric&lang=de');
    var weatherData = await networker.getData();
    return weatherData;
  }

  Future<dynamic> getCityForecast(String city) async {
    Networker networker = Networker(
        url:
            'https://api.openweathermap.org/data/2.5/onecall?weather?q=$city&appid=$apiKey&units=metric&lang=de');
    print(
        'https://api.openweathermap.org/data/2.5/onecall?weather?q=$city&appid=$apiKey&units=metric&lang=de');
    var forecastData = await networker.getData();
    return forecastData;
  }

  static String getWeahterImage(int condition) {
    if (condition <= 232) {
      return 'thunderstorm.png';
    } else if (condition <= 321) {
      return 'drizzle.png';
    } else if (condition <= 531) {
      return 'rain.png';
    } else if (condition <= 622) {
      return 'snow.png';
    } else if (condition <= 781) {
      return 'mist.png';
    } else if (condition == 800) {
      return 'sun.png';
    } else if (condition <= 804) {
      return 'cloud.png';
    } else {
      return 'cloud.png';
    }
  }
}
