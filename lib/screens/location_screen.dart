import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late double temp;
  late String city;
  late String weatherMessage;
  late Icon weatherIcon;
  late int airQuality;
  late int humidity;
  late String airQualityText;

  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);
  }

  updateUI(dynamic weatherData){
    setState(() {
      if(weatherData == null){
        double temp = 0.0;
        weatherMessage = 'Unable to get weather data';
        city = '';
        return;
      }
      double temp = weatherData['current']['temp_c'].toDouble();
      temperature = temp.toInt();
      city = weatherData['location']['name'];
      weatherMessage = weatherData['current']['condition']['text'];
      //weatherIcon = weatherData['current']['condition']['icon'];
      airQuality = weatherData['current']['air_quality']['gb-defra-index'];
      humidity = weatherData['current']['humidity'];

      if (airQuality>1 && airQuality<=3) {
         airQualityText = 'Low';
      } else if (airQuality>3 && airQuality<=6) {
        airQualityText = 'Moderate';
      } else if (airQuality>6 && airQuality<=9) {
        airQualityText = 'Good';
      } else if (airQuality>9) {
        airQualityText = 'Very Good';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/drizzle.jpg'),
              fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text('$temperature°',
                        style: const TextStyle(
                          fontSize: 100.0,
                          color: Colors.white,
                        ),
                    ),
                    const Text('C',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(city,
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text(weatherMessage,
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text('Air Quality $airQualityText',
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
                Text('Humidity $humidity%',
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              ],
            )
        ),
      ),
    );
  }
}
