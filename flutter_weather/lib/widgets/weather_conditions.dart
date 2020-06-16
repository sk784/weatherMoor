import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:meta/meta.dart';


class WeatherConditions extends StatelessWidget {
  final Weather weather;

  WeatherConditions({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) => _mapConditionToImage(weather);

  Image _mapConditionToImage(Weather weather) {
    Image image;
    switch (weather.condition) {
      case "c":
      case "lc":
        image = Image.asset('assets/clear.png');
        break;
      case "h":
      case "sn":
      case "sl":
        image = Image.asset('assets/snow.png');
        break;
      case "hc":
        image = Image.asset('assets/cloudy.png');
        break;
      case "hr":
      case "lr":
      case "s":
        image = Image.asset('assets/rainy.png');
        break;
      case "t":
        image = Image.asset('assets/thunderstorm.png');
        break;
      default:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }
}


