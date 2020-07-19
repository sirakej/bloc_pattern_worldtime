import 'dart:convert';
import 'package:blocpatternworldtime/model/timeResponse.dart';
import 'package:http/http.dart' show Client;

class ApiProvider{

  Client client = Client();
  final _baseUrl = "http://worldtimeapi.org/api/timezone/Africa/Lagos";

  Future<TimeResponse> getData() async{
    final response = await client.get("$_baseUrl");
    //print(response.body.toString());

    if(response.statusCode == 200){
      return TimeResponse.fromJson(jsonDecode(response.body));
    } else{
      throw Exception("failed to load time");
    }
  }

//  TimeResponse parseJson(final response){
//    final jsonDecoded = jsonDecode(response);
//
//    final jsonTime = jsonDecoded['datetime'];
//
//  //  return TimeResponse.fromJson();
//
//  }

}