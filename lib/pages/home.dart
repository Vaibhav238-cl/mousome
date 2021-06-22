import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mousome/pages/loading.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchvalue = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map infor = ModalRoute.of(context)!.settings.arguments as Map;

    print(infor["temp"]);
    print(infor["air"]);
    print(infor["des"]);
    print(infor["hum"]);
    print(infor["icon"]);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Colors.blueGrey,
                    Colors.blue,
                  ],
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0),
                        Expanded(
                            child: TextField(
                          controller: searchvalue,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Name Any City",
                            hintStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.black45,
                            ),
                          ),
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                        GestureDetector(
                          onTap: () {
                            if ((searchvalue.text).replaceAll(" ", "") == "") {
                              print("Please ENTER");
                            } else {
                              Navigator.pushReplacementNamed(
                                  context, "/loading",
                                  arguments: {
                                    "search": searchvalue.text,
                                  });
                            }
                            print(searchvalue.text);
                          },
                          child: Container(
                            child: Icon(Icons.search, color: Colors.deepPurple),
                            margin:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white38,
                      // gradient: LinearGradient(colors: [Colors.pink, Colors.red]),
                    ),
                  ),
                  // now i made center container
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 8.0),
                            margin: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                Container(
                                  child: Image.network(
                                    "http://openweathermap.org/img/wn/${infor["icon"]}@2x.png",
                                  ),
                                  width: 65.0,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "${infor["des"]}",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "in ${infor["loc"]}",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 8.0),
                          margin: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Icon(WeatherIcons.thermometer,
                                        color: Colors.white),
                                    Text(
                                      "Temperature",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                alignment: Alignment.topLeft,
                              ),
                              SizedBox(
                                height: 1.0,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${infor["temp"]}",
                                        style: TextStyle(
                                          fontSize: 60.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "c",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          height: 150.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 180.0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.water,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Text(
                                    "Humidity",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${infor["hum"]} %",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                      SizedBox(
                        width: 2.0,
                      ),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 8.0),
                        margin: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 7.0),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        height: 180.0,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.air,
                                  color: Colors.white,
                                ),
                                Expanded(
                                  child: Text(
                                    "AirSpeed",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${infor["air"]} m/s",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        child: Text(
                          "MADE BY VAIBHAV",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        width: 400.0,
                        height: 50.0,
                        alignment: Alignment.center),
                  ),

                  SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
