import 'package:flutter_weather/database/weather.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'database.g.dart';

@UseMoor(tables: [
  Weather
],)
class Database extends _$Database  {
  Database()
      : super(FlutterQueryExecutor.inDatabaseFolder(path: 'weather.sqlite'));


  @override
  int get schemaVersion => 1;

  Future<List<WeatherData>> getWeather() => select(weather).get();
  Future insertWeather(WeatherData weathers) => into(weather).insert(weathers);
  Future updateWeather(WeatherData weathers) => update(weather).replace(weathers);



}