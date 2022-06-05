import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  TextButton.icon(
                      onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState((){
                         data = {
                           'location' : result['location'],
                           'flag' : result['flag'],
                           'time' : result['time'],
                           'isDayTime' : result['isDayTime'],
                         };
                       });
                      },
                      label: Text(
                        "Edit Loaction",
                        style: TextStyle(
                          color: Colors.grey[300]
                        ),
                      ),
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
