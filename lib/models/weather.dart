class WeatherModel {
  dynamic temp;
  dynamic pressure;
  dynamic humidity;
  WeatherModel({
    this.temp,
    this.pressure,
    this.humidity,
  });
  factory WeatherModel.fromMap(Map<String, dynamic> map) {
    return WeatherModel(
      temp: map['main']['temp'] ?? '',
      pressure: map['main']['pressure'] ?? '',
      humidity: map['main']['humidity'] ?? '',
    );
  }
}
