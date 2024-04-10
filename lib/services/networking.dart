import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking{
  Future<dynamic> getData(String url) async {
    http.Response response = await  http.get(Uri.parse(url));

    if(response.statusCode==200){
      String data = response.body;
      final dataDecode = jsonDecode(data);
      return dataDecode;
    }else{
      print(response.statusCode);

    }

  }
}

