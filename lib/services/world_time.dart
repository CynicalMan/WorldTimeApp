
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //location name for the ui
  String? time;// hte time in that location
  Uri? url;// url is an asset flag icon
  String flag;// location url for api endpoint
  bool? isDayTime; // true or false if daytime or not

  WorldTime({required this.location , required this.flag});

  Future<void> asyncGetTime() async{

    try {
      url = Uri(
          scheme: 'https',
          host: 'worldtimeapi.org',
          path: '/api/timezone/${location}'
      );

      Response result = await get(url!);
      Map data = jsonDecode(result.body);

      String datetime = data['datetime'];
      print(datetime);
      String offset = data['utc_offset'];
      offset = offset.substring(1,3);

      DateTime now = DateTime.parse(datetime);

      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
      print(now);
    }catch(e){
      print('caught an error : $e');
      time = 'could not get a time ERROR';
    }



  }

}


