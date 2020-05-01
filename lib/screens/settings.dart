import 'package:earthquakeapp/screens/earthquake_list.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EarthquakeListScreen(),
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(left: 10),
          child: Text(
            "Settings",
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.indigo[900],
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
              itemCount: 13,
              itemBuilder: (context, int index) {
                return InkWell(
                  onTap: () {
//                      Navigator.push(context,
//                        MaterialPageRoute(
//                          builder: (context) => ,
//                        ),
//                      );
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
                              "1.0",
                              style: new TextStyle(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ),
                          title: Container(
                            margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 0,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "29KM SSW OF",
                                  style: new TextStyle(
                                      fontSize: 10, color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hawthorne, Nevada",
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
