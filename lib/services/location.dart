import 'package:geolocator/geolocator.dart';

class Location{
  late double _latitude;
  late double _longitude;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }

  double get longitude => _longitude;

  double get latitude => _latitude;
}