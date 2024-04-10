import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
 Future<void> getWeatherData() async {
   Location location= Location();
   await location.getCurrentLocation();
   latitude = location.latitude;
   longitude = location.longitude;
   String url ='https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=123e72837ae38cc4194256d87b0a6014&units=metric';
    var weatherData = await Networking().getData(url);

     double temp = weatherData['main']['temp'];
     int id = weatherData['weather'][0]['id'];
     String name = weatherData['name'];
     print("Risultato: $id");
     print("Temperature: $temp");
     print("Name: $name");
   Navigator.push(
     context,
     MaterialPageRoute(builder: (context) => LocationScreen(weatherData)),
   );
 }
 @override
  void initState() {
    // TODO: implement initState
   getWeatherData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
       Center(
         child:  SpinKitRotatingCircle(
           color: Colors.white,
           size: 50.0,
         ),
       ),
    );
  }
}
