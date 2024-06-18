import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class WeatherMap extends StatefulWidget {
  const WeatherMap({super.key});

  @override
  State<WeatherMap> createState() => _WeatherMapState();
}

class _WeatherMapState extends State<WeatherMap> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    // Initialize platform-specific WebView implementations
    if (WebViewPlatform.instance == null) {
      if (defaultTargetPlatform == TargetPlatform.android) {
        WebViewPlatform.instance = AndroidWebViewPlatform();
      } else if (defaultTargetPlatform == TargetPlatform.iOS) {
        WebViewPlatform.instance = WebKitWebViewPlatform();
      }
    }

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://earth.nullschool.net/#current/wind/surface/level/orthographic=-224.24,-0.73,329'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Weather Map', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(28, 27, 31, 1),
        ),
        height: 700,
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}
