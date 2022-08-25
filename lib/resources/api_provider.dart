import 'package:dio/dio.dart';

import '../models/weather.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<WeatherModel> fetchWeather(String city) async {
    Response response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=43ea6baaad7663dc17637e22ee6f78f2');

    return WeatherModel.fromMap(response.data);
  }
}
