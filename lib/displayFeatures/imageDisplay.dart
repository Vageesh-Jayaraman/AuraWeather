import 'package:flutter/material.dart';
import 'package:auraweather/utilities/NetworkRouter.dart';
import 'package:auraweather/utilities/getDateTime.dart';
import 'package:google_fonts/google_fonts.dart';

NetworkRoute networkRoute = NetworkRoute();
final formatter = DateTimeFormatter();

Container getTemperature({required int temperature}) {
  return Container(
    alignment: Alignment.topRight,
    padding: EdgeInsets.fromLTRB(0, 10, 20, 0),
    child: Text(
      '${temperature - 273}°C', 
      style: const TextStyle(
        fontFamily: 'Mulish',
        color: Colors.black,
        fontSize: 50,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Container getDateTime({required String dateTimeString}) {
  return Container(
    alignment: Alignment.topRight,
    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
    child: Text(
      '${formatter.formatDate(dateTimeString)}, ${formatter.formatTime(dateTimeString)}',
      style: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    ),
  );
}

Container getSubheadings ({required String text}) {
  return Container(
    alignment: Alignment.topRight,
    padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
    child: Text(
      text,
      style: GoogleFonts.mulish(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: Colors.black,
      ),
    ),
  );
}


Container getImage({required String weather}) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: ClipRRect(
      child: Image.asset('assets/images/$weather.jpg',),
      borderRadius: BorderRadius.circular(30),
    ),
  );
}
