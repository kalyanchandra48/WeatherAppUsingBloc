import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/bloc/weather_bloc.dart';
import 'package:weather_bloc/bloc/weather_events.dart';
import 'package:weather_bloc/bloc/weather_states.dart';
import 'package:weather_bloc/models/weather.dart';
import 'package:weather_bloc/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => WeatherBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();
  WeatherModel weather = WeatherModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff2C5D9B),
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.pixelstalk.net/wp-content/uploads/2016/07/Download-Free-Weather-Background.jpg'),
                fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotSearched) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 5),
                      height: 90,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(19)),
                        color: Colors.orange,
                      ),
                      child: Center(
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorHeight: 30,
                          decoration: const InputDecoration(
                              hintText: 'Enter a valid City',
                              hintStyle: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w700),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                          controller: textController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.black, // Text Color
                        ),
                        onPressed: () {
                          context.read<WeatherBloc>().add(
                              SearchWeatherEvent(city: textController.text));
                        },
                        child: const Text(
                          'Search Weather',
                          style: TextStyle(fontSize: 24),
                        ))
                  ],
                );
              } else if (state is WeatherIsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WeatherIsLoaded) {
                return WeatherPage(
                    weather: state.getWeather, city: textController.text);
              }
              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
