import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/bloc/weather_events.dart';
import 'package:weather_bloc/models/weather.dart';

class WeatherPage extends StatelessWidget {
  WeatherPage({
    Key? key,
    required this.weather,
    required this.city,
  }) : super(key: key);
  late WeatherModel weather;
  late String city;

  @override
  Widget build(BuildContext context) {
    double temperature = weather.temp - 272.5;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'City: $city',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            'Temperature:${temperature.toString().substring(0, 5)} Celcius',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Humidity:${weather.humidity.toString()}',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Pressure:${weather.pressure.toString()}',
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black, // Text Color
              ),
              onPressed: () {
                context.read<WeatherBloc>().add(ResetWeatherEvent());
              },
              child: const Text(
                'Reset Weather',
                style: TextStyle(fontSize: 24),
              )),
        ],
      ),
    );
  }
}
