class WeatherEvent {}

class SearchWeatherEvent extends WeatherEvent {
  final String city;
  SearchWeatherEvent({required this.city});
}

class ResetWeatherEvent extends WeatherEvent {}
