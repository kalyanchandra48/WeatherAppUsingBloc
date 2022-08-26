import 'package:weather_bloc/models/weather.dart';

class WeatherState {}

class WeatherIsNotSearchedState extends WeatherState {}

class WeatherIsLoadingState extends WeatherState {
  final String text;
  WeatherIsLoadingState(this.text);
}

class WeatherIsLoadedState extends WeatherState {
  final WeatherModel _weather;

  WeatherIsLoadedState(this._weather);

  WeatherModel get getWeather => _weather;
}
