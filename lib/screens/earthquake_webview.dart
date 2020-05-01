import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EarthquakeWebView extends StatelessWidget {
  final String url;
  EarthquakeWebView(this.url);

//  Completer<EarthquakeWebView> _completer = Completer<EarthquakeWebView>();
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
            "Earth Quake Detail",
            style: new TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
                color: Colors.white),
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
