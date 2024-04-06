import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';
import 'location_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
 Future<void> getData() async {
   http.Response response = await  http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=33.44&lon=-94.04&appid=123e72837ae38cc4194256d87b0a6014'));

   if(response.statusCode==200){
     String data = response.body;
     final dataDecode = jsonDecode(data);
     double temp = dataDecode['hourly'][0]['temp'];
     int id = dataDecode['weather'][0]['id'];

     print("risultato $id");
   }else{
     print(response.statusCode);
   }
 } 
  
 void getLocation() async {
    Location location= Location();
    await location.getCurrentLocation();
    double latitude = location.latitude;
    double longitude = location.longitude;
    print("Latitude: $latitude Longitude: $longitude");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            getData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
