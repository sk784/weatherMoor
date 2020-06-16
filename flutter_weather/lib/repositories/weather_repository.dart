import 'package:flutter_weather/models/weather.dart';
import 'package:flutter_weather/repositories/weather_api_client.dart';

class WeatherRepository {
  final WeatherApiClient weatherApiClient;

  WeatherRepository({this.weatherApiClient})
      : assert(weatherApiClient != null);

  Future<Weather> getWeather(int year, int month,int day) async {
    final int locationId = await weatherApiClient.getLocationId("Moscow");
    return weatherApiClient.fetchWeather(locationId,year,month,day);
  }
}