import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auraweather/utilities/NetworkRouter.dart';

NetworkRoute networkRoute = NetworkRoute();

Container DisplayBox({
  required IconData icon,
  required String text,
  required List<Color> colors,
  required String heading,
}) {
  return Container(
    height: 120,
    width: 120,
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        colors: colors,
      ),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            heading,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Icon(icon),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}

List<Color> selectGradient(String weatherType) {
  if (weatherType == 'Clear' || weatherType == 'Haze' || weatherType == 'Fog' || weatherType == 'Mist') {
    return [
      Color.fromARGB(255, 214, 218, 38),
      Color.fromARGB(255, 90, 179, 220),
    ];
  } else if (weatherType == 'Drizzle' || weatherType == 'Rain' || weatherType == 'Thunderstorm' || weatherType == 'Squall' || weatherType == 'Tornado') {
    return [
      Color.fromARGB(255, 127, 180, 183),
      Color.fromARGB(255, 25, 137, 208),
    ];
  } else if (weatherType == 'Sand' || weatherType == 'Dust' ||  weatherType == 'Ash') {
    return [
      Color.fromARGB(255, 191,93,40),
      Color.fromARGB(255, 137,117,112),
    ];
  }
  else if (weatherType == 'Clouds') {
    return [
      Color.fromARGB(255, 74, 147, 180),
      Color.fromARGB(255, 150, 161, 25),
    ];
  } else {
    return [
      Color.fromARGB(255, 167, 215, 165),
      Color.fromARGB(255, 93, 170, 198),
    ];
  }
}
