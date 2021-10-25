import 'package:flutter/cupertino.dart';
import 'package:my_weather_app/services/weather_model.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  late int temperature;
  late String city;
  late String weatherMessage;
  late Icon weatherIcon;
  late int airQuality;
  late int humidity;

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        temperature = 0;
        weatherMessage = 'Unable to get weather data';
        city = '';
        return;
      }
      temperature = weatherData['current']['temp_c'].toDouble();
      city = weatherData['location']['name'];
      weatherMessage = weatherData['current']['condition']['text'];
      weatherIcon = weatherData['current']['condition']['icon'];
      airQuality = weatherData['current']['air_quality']['gb-defra-index'];
      humidity = weatherData['current']['humidity'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
