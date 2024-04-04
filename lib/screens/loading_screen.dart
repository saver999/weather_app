import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/location.dart';
import 'location_screen.dart';
import 'package:http/http.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  
 Future<void> getData() async {
   Response response = await get('https://api.openweathermap.org/data/3.0/onecall?lat=33.44&lon=-94.04&appid={c05dd6910a8ee6736626b70dbf459ad6}' as Uri);
   if(response.statusCode==200){
     String data = response.body;
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
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
