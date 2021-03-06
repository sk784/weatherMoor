import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocks/weather_bloc.dart';
import 'package:flutter_weather/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    weatherBloc.add(TodayWeather());
    return Scaffold(
        appBar: AppBar(
          title: Text('Today'),
        ),
        body: Center(
          child: BlocBuilder(
              bloc: weatherBloc,
              // ignore: missing_return
              builder: (_, WeatherState state) {
                if (state is WeatherEmpty) {
                  return Center(child: Text('No Data'));
                }
                if (state is WeatherLoading) {
                  return Center(child: CircularProgressIndicator());
                }
                if (state is WeatherError) {
                  return Text(
                    'Something went wrong!',
                    style: TextStyle(color: Colors.red),
                  );
                }
                if (state is WeatherLoaded) {
                  final weather = state.weather;
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        WeatherWidget(weather: weather,),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RaisedButton(
                                color: Colors.blue,
                                child: Text("Yesterday"),
                                onPressed: () =>
                              Navigator.of(context).pushReplacementNamed("/Yesterday")
                              ),
                              RaisedButton(
                                  color: Colors.blue,
                                  child: Text("Tomorrow"),
                                  onPressed: () =>
                                      Navigator.of(context).pushReplacementNamed("/Tomorrow")
                              )
                             ]
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
          ),
        )
    );
  }
}