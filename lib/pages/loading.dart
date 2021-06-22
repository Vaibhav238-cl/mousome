import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mousome/Worker/worker.dart';

import 'package:mousome/pages/home.dart';

class LodingPage extends StatefulWidget {
  @override
  _LodingPageState createState() => _LodingPageState();
}

class _LodingPageState extends State<LodingPage> {
  String city = "Raigarh";
  String so = "1";
  void getstart(String city) async {
    worker w1 = worker(location: city);
    await w1.getData();
    String airspeed_value = w1.airspeed;
    String temp_value = w1.temp;
    String hum_value = w1.hum;
    String des_value = w1.des;
    String icon_value = w1.icon;
    String loaction_value = w1.location;
    // JSON.encode(data) in Dart 1.x
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/home", arguments: {
        "air": airspeed_value,
        "temp": temp_value,
        "hum": hum_value,
        "des": des_value,
        "icon": icon_value,
        "loc": loaction_value,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // igno
    // ignore: unused_local_variable
    try {
      Map sos = ModalRoute.of(context)!.settings.arguments as Map;
      String search = sos["search"];
      if (search != null) {
        city = search;
      }
    } catch (e) {
      print(e);
    }
    getstart(city);

    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/weather.png",
              width: 200,
              height: 200,
            ),
            Text(
              "Mousome App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue[300],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            SpinKitWave(
              color: Colors.blue[200],
              size: 50.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            Text(
              "MADE BY VAIBHAV",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue[200],
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
