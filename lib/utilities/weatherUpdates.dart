import 'package:auraweather/utilities/weatherPage.dart';
import 'package:flutter/material.dart';


class UpdateBox extends StatefulWidget {
  final int index;
  final String iconName;
  final int temperature;
  final String dateTimeString;
  final String subHeading;
  final VoidCallback onTap;

  UpdateBox({
    required this.index,
    required this.iconName,
    required this.temperature,
    required this.dateTimeString,
    required this.subHeading,
    required this.onTap,
  });

  @override
  State<UpdateBox> createState() => _UpdateBoxState();
}

class _UpdateBoxState extends State<UpdateBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 100,
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.teal,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          fit: StackFit.loose,
          children: [
            Positioned(
              top: 5,
              child: Text(
                '${widget.temperature - 273}°C',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
            Positioned(
              top: 10,
              child: Image.asset(
                'assets/icons/${widget.iconName}.png',
                width: 60,
              ),
            ),
            Positioned(
              top: 60,
              child: Text(
                formatter.formatDate(widget.dateTimeString),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              top: 75,
              child: Text(
                formatter.formatTime(widget.dateTimeString),
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}