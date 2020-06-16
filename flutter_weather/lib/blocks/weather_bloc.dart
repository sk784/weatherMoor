import 'package:flutter_weather/database/database.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:flutter_weather/repositories/weather_api_client.dart';
import 'package:flutter_weather/repositories/weather_repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;

abstract class WeatherEvent extends Equatable {
  WeatherEvent([List props = const []]) : super(props);
}

class TodayWeather extends WeatherEvent {}

class YesterdayWeather extends WeatherEvent {}

class TomorrowWeather extends WeatherEvent {}

/////////////////////////////////////////////

abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  WeatherLoaded({@required this.weather})
      : assert(weather != null),
        super([weather]);
}

class WeatherError extends WeatherState {}

///////////////////////////////////////////////////

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final weatherRepository = WeatherRepository(weatherApiClient: WeatherApiClient(
    httpClient: http.Client(),
  ),
  );

  final Database db = Database();

  @override
  WeatherState get initialState => WeatherEmpty();

  @override
  Stream<WeatherState> mapEventToState(
      WeatherEvent event,
      ) async* {
    if (event is TodayWeather) {
      DateTime date = DateTime.now();
      yield WeatherLoading();
      try {
        final List<WeatherData> weatherFromApi = List();
        final List<Weather> weatherFromDb = List();
        var result = await db.getWeather();
        if(result.isNotEmpty){
          if((result[0].date.day!=date.day)||(result[0].date.month!=date.month)||(result[0].date.year!=date.year)){
            final weather = await weatherRepository.getWeather(date.year,date.month,date.day);
            weatherFromApi.add(WeatherData(id:1,condition:weather.condition,date: DateTime.now(),temp:weather.temp.round()));
            db.updateWeather(weatherFromApi[0]);
            var result2 = await db.getWeather();
            weatherFromDb.add(Weather(condition:result2[0].condition,temp:result2[0].temp.roundToDouble()));
          } else {
            weatherFromDb.add(Weather(condition:result[0].condition,temp:result[0].temp.roundToDouble()));
          }
        } else {
          final weather = await weatherRepository.getWeather(date.year,date.month,date.day);
          weatherFromApi.add(WeatherData(id:1,condition:weather.condition,date: DateTime.now(),temp:weather.temp.round()));
          weatherFromApi.add(WeatherData(id:2,condition:weather.condition,date: DateTime.now(),temp:weather.temp.round()));
          weatherFromApi.add(WeatherData(id:3,condition:weather.condition,date: DateTime.now(),temp:weather.temp.round()));
          db.insertWeather(weatherFromApi[0]);
          db.insertWeather(weatherFromApi[1]);
          db.insertWeather(weatherFromApi[2]);
          var result2 = await db.getWeather();
          weatherFromDb.add(Weather(condition:result2[0].condition,temp:result2[0].temp.roundToDouble()));
        }
        yield WeatherLoaded(weather: weatherFromDb[0]);
      } catch (_) {
        yield WeatherError();
      }
    }

    if (event is YesterdayWeather) {
      DateTime date = DateTime.now().subtract(Duration(days: 1));
      yield WeatherLoading();
      try {
        final List<WeatherData> weatherFromApi = List();
        final List<Weather> weatherFromDb = List();
        var result = await db.getWeather();
          if((result[1].date.day!=date.day)||(result[1].date.month!=date.month)||(result[1].date.year!=date.year)){
            final weather = await weatherRepository.getWeather(date.year,date.month,date.day);
            weatherFromApi.add(WeatherData(id:2,condition:weather.condition,date: DateTime.now().subtract(Duration(days: 1)),temp:weather.temp.round()));
            db.updateWeather(weatherFromApi[0]);
            var result2 = await db.getWeather();
            weatherFromDb.add(Weather(condition:result2[1].condition,temp:result2[1].temp.roundToDouble()));
          } else {
            weatherFromDb.add(Weather(condition:result[1].condition,temp:result[1].temp.roundToDouble()));
          }
        yield WeatherLoaded(weather: weatherFromDb[0]);
      } catch (_) {
        yield WeatherError();
      }
    }

    if (event is TomorrowWeather) {
      DateTime date = DateTime.now().add(Duration(days: 1));
      yield WeatherLoading();
      try {
        final List<WeatherData> weatherFromApi = List();
        final List<Weather> weatherFromDb = List();
        var result = await db.getWeather();
          if((result[2].date.day!=date.day)||(result[2].date.month!=date.month)||(result[2].date.year!=date.year)){
            final weather = await weatherRepository.getWeather(date.year,date.month,date.day);
            weatherFromApi.add(WeatherData(id:3,condition:weather.condition,date: DateTime.now().add(Duration(days: 1)),temp:weather.temp.round()));
            db.updateWeather(weatherFromApi[0]);
            var result2 = await db.getWeather();
            weatherFromDb.add(Weather(condition:result2[2].condition,temp:result2[2].temp.roundToDouble()));
          } else {
            weatherFromDb.add(Weather(condition:result[2].condition,temp:result[2].temp.roundToDouble()));
          }
        yield WeatherLoaded(weather: weatherFromDb[0]);
      } catch (_) {
        yield WeatherError();
      }
    }
  }
}
