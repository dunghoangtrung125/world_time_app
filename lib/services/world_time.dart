import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  String location;
  String time;
  String flag;
  String url;
  bool dayTime;
  worldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url')) as Response;
      Map data = jsonDecode(response.body);

      // get properties of data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(data);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // time properties
      time = DateFormat.jm().format(now);
      dayTime = now.hour > 6 && now.hour < 18 ? true : false; // day or night
      //print(time);
    }
    catch(e) {
      print('error is $e');
      time = 'Retry Please';
    }

  }
}


//instance.getTime();