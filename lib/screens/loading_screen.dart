import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_weather_app/services/weather_model.dart';
import 'package:my_weather_app/utils/constants.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:permission_handler/permission_handler.dart';

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _checkPermission();
    //getLocationData();
  }

  Future<void> _checkPermission() async {

    final status = await Permission.locationWhenInUse.request();
    if (status == PermissionStatus.granted) {
      getLocationData();
    } else if (status == PermissionStatus.denied) {
      return;
    } else if (status == PermissionStatus.permanentlyDenied) {
      //await openAppSettings();
      return handlePermission(context);
    }
  }

  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlowingProgressIndicator(
              child: locationIcon,
            ),
            FindMe(
                whatToDoOnPressed: () {
                  Permission.locationWhenInUse.request();
                }
            ),
          ],
        ),
      ),
    );
  }
}
