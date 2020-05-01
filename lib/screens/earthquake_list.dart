import 'dart:async';
import 'dart:convert';

import 'package:earthquakeapp/screens/earthquake_webview.dart';
import 'package:earthquakeapp/screens/settings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EarthquakeListScreen extends StatefulWidget {
  @override
  _EarthquakeListScreenState createState() => _EarthquakeListScreenState();
}

class _EarthquakeListScreenState extends State<EarthquakeListScreen> {
  static int minMag = 3;
  static int startYr = 2020;
  static int startMon = 04;
  static int startDay = 15;
  static int endYr = 2020;
  static int endMon = 05;
  static int endDay = 01;

  final String usgs_request_url =
      "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&" +
          "starttime=" +
          startYr.toString() +
          "-" +
          startMon.toString() +
          "-" +
          startDay.toString() +
          "&" +
          "endtime=" +
          endYr.toString() +
          "-" +
          endMon.toString() +
          "-" +
          endDay.toString() +
          "&" +
          "minmagnitude=" +
          minMag.toString();

  List earthquakeList;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http
        .get(Uri.encodeFull(usgs_request_url), headers: {"type": "Feature"});

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      earthquakeList = convertDataToJson["features"];
    });

    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            "Quake Report",
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
            color: Colors.white,
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: earthquakeList == null ? 0 : earthquakeList.length,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EarthquakeWebView(
                            earthquakeList[index]["properties"]["url"]),
                      ),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.deepOrange,
                            child: Text(
                              double.parse((earthquakeList[index]["properties"]
                                          ["mag"])
                                      .toStringAsFixed(1))
                                  .toString(),
//                            "1.0",
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(
                              top: 3,
                              bottom: 0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  earthquakeList[index]["properties"]["place"],
                                  style: new TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  earthquakeList[index]["properties"]["place"],
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          trailing: Container(
                            margin: const EdgeInsets.only(
                              top: 0,
                              bottom: 10,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Jul 21, 2020",
                                  style: new TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "4:57 PM" + " " + "IST",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
