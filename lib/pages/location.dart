import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<worldTime> locations = [
    worldTime(location: 'London', flag: 'uk.png' , url: 'Europe/London'),
    worldTime(location: 'New York', flag: 'us.png', url: 'America/New_York'),
    worldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
    worldTime(location: 'Ho Chi Minh City', flag: 'vietnam.png', url: 'Asia/Ho_Chi_Minh'),
    worldTime(location: 'Paris', flag: 'france.png', url: 'Europe/Paris'),
    worldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    worldTime(location: 'Seoul', flag: 'korea.png', url: 'Asia/Seoul'),
    worldTime(location: 'Moscow', flag: 'russia.png', url: 'Europe/Moscow'),
  ];

  void updateTime(index) async {
    worldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'dayTime' : instance.dayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(locations[index].location),
              onTap: (){
                updateTime(index);
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),
          );
        },
      ),
    );
  }
}
