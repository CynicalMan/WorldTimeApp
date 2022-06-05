import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWorldTime() async{
    WorldTime ins = WorldTime(location: 'Africa/Cairo', flag: 'germany.png');
    await ins.asyncGetTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : ins.location,
      'flag' : ins.flag,
      'time' : ins.time,
      'isDayTime' : ins.isDayTime
    });
  }

  @override
  void initState(){
    super.initState();
    setWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child : SpinKitFoldingCube(
            color: Colors.white,
            size: 50.0,
          ),
      ),
    );
  }
}
