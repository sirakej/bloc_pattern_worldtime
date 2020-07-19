import 'dateTime_model.dart';
import 'timezone_model.dart';
import 'package:intl/intl.dart';

class TimeResponse{
  Datetime _datetime;
  Datetime _offset;
  Timezone _timezone;

//  fromJson() async{
//
//    //make request
//    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
//    Map data = jsonDecode(response.body);
//    //print(data['utc_datetime'])
//
//    //get properties from data
//    String dateTime = data['datetime'];
//    String offSet = data['utc_offset'].substring(1, 3);
//    //print(offSet);
//
//    //create object
//    DateTime now = DateTime.parse(dateTime);
//    now = now.add(Duration(hours: int.parse(offSet)));
//    why = now.hour > 6 && now.hour < 20 ? true : false;
//    //clock =int.parse(DateFormat('yyyy,MM,dd,HH,mm,ss').format(now));
//    time = DateFormat.jm().format(now);
//
//  }

 TimeResponse.fromJson(Map<String, dynamic> parsedJson){
   _datetime = Datetime(parsedJson['datetime']);

   _timezone = Timezone(parsedJson['timezone']);

 }

  Datetime get date => _datetime;

  set datetime(Datetime value) {
    _datetime = value;
  }

  Datetime get off => _offset;

  set offset(Datetime value) {
    _offset = value;
  }

  Timezone get time => _timezone;

  set timezone(Timezone value) {
    _timezone = value;
  }

}

