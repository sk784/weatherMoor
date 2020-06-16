import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/screens/home_screen.dart';
import 'package:flutter_weather/screens/splash_screen.dart';
import 'package:flutter_weather/screens/tomorrow_screen.dart';
import 'package:flutter_weather/screens/video_screen.dart';
import 'package:flutter_weather/screens/yesterday_screen.dart';
import 'package:provider/provider.dart';
import 'blocks/weather_bloc.dart';
import 'database/database.dart';


void main() {

  runApp(App());
}

class App extends StatelessWidget {

    final routes = <String, WidgetBuilder>{
      '/Home': (BuildContext context) => HomeScreen(),
      '/Yesterday': (BuildContext context) => YesterdayScreen(),
      '/Tomorrow': (BuildContext context) => TomorrowScreen(),
      '/Video': (BuildContext context) => VideoScreen()
    };

   @override
   Widget build(BuildContext context) {
   return Provider(
       create: (_) => Database(),
     child:BlocProvider<WeatherBloc>(
       create: (_) => WeatherBloc(),
     child: MaterialApp(
      title: 'Weather',
       routes: routes,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(nextRoute: '/Home'),
     )
     )
    );
   }

}
