
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
class WeatherModel {
  late double latitude;
  late double longitude;

  Future<dynamic> getWeatherDataLocation(String location)async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$location&appid=123e72837ae38cc4194256d87b0a6014&units=metric';
    var weatherData = await Networking().getData(url);
    return weatherData;
  }
    Future<dynamic> getWeatherData()async{
    Location location= Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String url ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=123e72837ae38cc4194256d87b0a6014&units=metric';
    var weatherData = await Networking().getData(url);
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
