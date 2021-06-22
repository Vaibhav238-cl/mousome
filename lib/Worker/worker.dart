import 'package:dio/dio.dart';

class worker {
  String location = "";

  String airspeed = "";

  String temp = "";

  String hum = "";

  String des = "";
  String icon = "";

  worker({required this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      var res = await Dio().get(
          "http://api.openweathermap.org/data/2.5/weather?q=$location,india&APPID=eb709fa1c830d35b9f8264bbbb2f270f");

      var getdata = res.data;

      // des data here
      List getweather = getdata["weather"];

      String geticon = getweather[0]["icon"];

      String getdes = getweather[0]["description"];

      // temp

      Map getmain = getdata["main"];

      double gettemp = getmain["temp"] - 273.15;

      // airspeed
      Map getwind = getdata["wind"];
      double getairspeed = getwind["speed"];
      // hum

      var gethum = getmain["humidity"];

      airspeed = getairspeed.toString();

      temp = gettemp.toString().substring(0, 4);

      hum = gethum.toString();

      des = getdes;
      icon = geticon;
    } catch (e) {
      location = "NA";

      airspeed = "NA";

      temp = "NA";

      hum = "NA";

      des = "NA";
      icon = "NA";

      print(e);
    }
  }
}
