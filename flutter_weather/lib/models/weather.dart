import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String condition;
  final double temp;

  Weather({
    this.condition,
    this.temp,
  }) : super([
    condition,
    temp,
  ]);

  static Weather fromJson(dynamic json) {
    return Weather(
      condition: json[0]['weather_state_abbr'],
      temp:json[0]['the_temp'] as double,
    );
  }
}