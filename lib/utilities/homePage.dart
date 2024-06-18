import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.yellowAccent, 
                    width: 1, 
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/homeScreen/logo.png',
                    width: 300,
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
        Text(
          'Discover Your Ultimate Weather Companion',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.yellow,
            shadows: [
              Shadow(
                color: Colors.teal.withOpacity(0.5),
                offset: Offset(2, 2),
                blurRadius: 5,
              ),
            ],
          ),
        ),
            ],
          ),
        )
      ),
    );
  }
}
