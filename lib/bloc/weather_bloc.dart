import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_events.dart';
import 'package:weather_bloc/bloc/weather_states.dart';
import 'package:weather_bloc/models/weather.dart';
import 'package:weather_bloc/resources/api_provider.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherIsNotSearchedState()) {
    final ApiProvider apiProvider = ApiProvider();

    on<SearchWeatherEvent>((event, emit) async {
      emit(WeatherIsLoadingState('Your Weather is Loading Please wait..'));
      try {
        WeatherModel response = await apiProvider.fetchWeather(event.city);
        emit(WeatherIsLoadedState(response));
      } catch (e) {
        emit(WeatherIsNotSearchedState());
      }
    });

    on<ResetWeatherEvent>((event, emit) => emit(WeatherIsNotSearchedState()));
  }
}
