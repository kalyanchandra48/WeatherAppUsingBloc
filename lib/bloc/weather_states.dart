import 'package:weather_bloc/models/weather.dart';

class WeatherState {}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {
  final String text;
  WeatherIsLoading(this.text);
}

class WeatherIsLoaded extends WeatherState {
  final WeatherModel _weather;

  WeatherIsLoaded(this._weather);

  WeatherModel get getWeather => _weather;
}
