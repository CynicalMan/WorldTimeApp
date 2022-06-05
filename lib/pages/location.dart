import 'package:flutter/material.dart';

import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(location: 'Europe/London', flag: 'uk.png'),
    WorldTime(location: 'Europe/Berlin', flag: 'greece.png'),
    WorldTime(location: 'Africa/Cairo', flag: 'egypt.png'),
    WorldTime(location: 'Africa/Nairobi', flag: 'kenya.png'),
    WorldTime(location: 'America/Chicago', flag: 'usa.png'),
    WorldTime(location: 'America/New_York', flag: 'usa.png'),
    WorldTime(location: 'Asia/Seoul', flag: 'south_korea.png'),
    WorldTime(location: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime ins = locations[index];
    await ins.asyncGetTime();
    //navigate to the home screen
    Navigator.pop(context, {
      'location' : ins.location,
      'flag' : ins.flag,
      'time' : ins.time,
      'isDayTime' : ins.isDayTime
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locations[index].location
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
