import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:auraweather/utilities/NetworkRouter.dart';
import 'package:auraweather/utilities/weatherUpdates.dart';
import 'package:auraweather/utilities/getDateTime.dart';
import 'package:auraweather/displayFeatures/imageDisplay.dart';
import 'package:auraweather/displayFeatures/featuresDisplay.dart';


NetworkRoute networkRoute = NetworkRoute();
final formatter = DateTimeFormatter();

int index = 0;


Stack wallPaperInfo({required int index}){
  return Stack(
    children: [
      getImage(weather: networkRoute.weatherUpdates[index].weatherMain),
      Column(
        children: [
          getTemperature(temperature: networkRoute.weatherUpdates[index].temperature),
          getDateTime(dateTimeString: networkRoute.weatherUpdates[index].dateTimeString),
          getSubheadings(text: networkRoute.loc),
          getSubheadings(text: networkRoute.weatherUpdates[index].weatherDesc),
          getSubheadings(text: 'feels like ${networkRoute.weatherUpdates[index].feelsLike - 273}°C'),
        ],
      ),
    ],
  );
}

Row conditionsInfo({required int index}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      DisplayBox(
        icon: CupertinoIcons.wind,
        text: '${networkRoute.weatherUpdates[index].windSpeed} m/s',
        colors: selectGradient(networkRoute.weatherUpdates[index].weatherMain),
        heading: 'Wind',
      ),
      DisplayBox(
        icon: CupertinoIcons.thermometer,
        text: '${networkRoute.weatherUpdates[index].pressure} hPa',
        colors: selectGradient(networkRoute.weatherUpdates[index].weatherMain),
        heading: 'Pressure',
      ),
      DisplayBox(
        icon: CupertinoIcons.drop,
        text: '${networkRoute.weatherUpdates[index].humidity}%',
        colors: selectGradient(networkRoute.weatherUpdates[index].weatherMain),
        heading: 'Humidity',
      ),
    ],
  );
}


class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool isLoading = true;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    await networkRoute.connectHTTP();
    setState(() {
      isLoading = false;
      print(networkRoute.weatherUpdates[0].dateTimeString);
    });
  }

  void updateIndex(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isLoading
          ? Center(
        child: CircularProgressIndicator(
          color: Colors.yellowAccent,
        ),
      )
          : ListView(
          scrollDirection: Axis.vertical,
          children: [
          wallPaperInfo(index: selectedIndex),
          conditionsInfo(index: selectedIndex),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: networkRoute.weatherUpdates.length,
              itemBuilder: (context, index) {
                return UpdateBox(
                  index: index,
                  iconName: networkRoute.weatherUpdates[index].weatherIcon,
                  temperature:
                  networkRoute.weatherUpdates[index].temperature,
                  subHeading:
                  networkRoute.weatherUpdates[index].weatherDesc,
                  dateTimeString:
                  networkRoute.weatherUpdates[index].dateTimeString,
                  onTap: () => updateIndex(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}