import 'package:http/http.dart' as http;
import 'location.dart';
import 'dart:convert';

String API_key = API_KEY;

class WeatherUpdate {
  String weatherMain;
  String weatherDesc;
  String weatherIcon;
  int temperature;
  int feelsLike;
  int humidity;
  int pressure;
  int windSpeed;
  String dateTimeString;

  WeatherUpdate({
    required this.weatherMain,
    required this.weatherDesc,
    required this.weatherIcon,
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.windSpeed,
    required this.dateTimeString,
  });
}

class NetworkRoute {
  late double latitude;
  late double longitude;
  String country_code = "";
  String area_name = "";
  String loc = "";

  List<WeatherUpdate> weatherUpdates = [];

  Future<void> connectHTTP() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    print(latitude);
    print(longitude);

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$API_key'));
    String data = response.body;

    var decodedData = jsonDecode(data);

    country_code = decodedData['city']['country'];
    area_name = decodedData['city']['name'];
    loc = "$country_code, $area_name";

    weatherUpdates = List.generate(16, (index) {
      var item = decodedData['list'][index];
      return WeatherUpdate(
        weatherMain: item['weather'][0]['main'],
        weatherDesc: item['weather'][0]['description'],
        weatherIcon: item['weather'][0]['icon'],
        temperature: (item['main']['temp'] as num).toInt(),
        feelsLike: (item['main']['feels_like'] as num).toInt(),
        humidity: (item['main']['humidity'] as num).toInt(),
        pressure: (item['main']['pressure'] as num).toInt(),
        windSpeed: (item['wind']['speed'] as num).toInt(),
        dateTimeString: item['dt_txt'],
      );
    });
  }
}
