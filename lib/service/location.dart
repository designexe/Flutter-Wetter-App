import 'package:geolocator/geolocator.dart';

class Location {
  double _lat;
  double _lon;

  Location();

  Future<void> getMyLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _lon = position.longitude;
      _lat = position.latitude;
    } catch (e) {
      print(e);
    }
  }

  double getLat() {
    return _lat;
  }

  double getLon() {
    return _lon;
  }
}
