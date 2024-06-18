import 'package:flutter/material.dart';
import 'dart:async';
import 'utilities/weatherPage.dart';
import 'utilities/weatherMap.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:auraweather/utilities/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _showHomePage = true;

  static const List<Widget> _pages = <Widget>[
    WeatherPage(),
    WeatherMap(),
  ];

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        _showHomePage = false;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _showHomePage ? HomePage() : _pages[_selectedIndex],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Color.fromRGBO(48, 48, 48, 1),
        backgroundColor: Color.fromRGBO(28, 27, 31, 1),
        items: <Widget>[
          Icon(Icons.cloudy_snowing, size: 20),
          Icon(Icons.map, size: 20),
        ],
        onTap: _onItemTapped,
        index: _selectedIndex,
      ),
    );
  }
}

