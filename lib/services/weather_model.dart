import 'package:my_weather_app/services/location.dart';
import 'package:my_weather_app/services/networking.dart';

String _apiKey = '3e539e543857457580d53610212410';
String _url = 'http://api.weatherapi.com/v1/current.json?key=$_apiKey';

class WeatherModel {
  Future<dynamic> getCityWeather(String userEnteredCityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$_url&q=$userEnteredCityName&aqi=yes');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    NetworkHelper networkHelper =
        NetworkHelper('$_url&q=${loc.latitude},${loc.longitude}&aqi=yes');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
