import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather.dart';
import 'package:flutter_weather/widgets/weather_conditions.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget({Key key, @required this.weather})
      : assert(weather != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
         Padding(
           padding: EdgeInsets.only(top: 100.0),
              child: Center(
                 child: Text("Moscow",
              style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.w600,
              ),
          ),
        ),
      ),
            Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Center(
                 child: Column(
                  children: [
                    Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Padding(
                         padding: EdgeInsets.all(20.0),
                        child: Text(
                          '${weather.temp.round()}°C',
                         style: TextStyle(
                          fontSize: 32,
                         fontWeight: FontWeight.w600,
                        ),
                     )
                     ),
                        Padding(
                         padding: EdgeInsets.all(20.0),
                          child: WeatherConditions(weather: weather),
                          ),
                      ],
                     ),
                      ],
                )
               ),
             ),
          SizedBox(height: 50,
      ),
    ]
    );
  }
}
