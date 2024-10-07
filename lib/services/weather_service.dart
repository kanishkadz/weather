import 'dart:convert';

import '../models/weather_model.dart';
import 'package:http/http.dart' as https;

class WeatherService{

  static const BASE_URL = 'http://api.openweathermap.org/data/2.5/weather';
  final String apiKey;

  WeatherService(this.apiKey){

    Future<Weather> getWeather(String cityName) async{
      final response = await https.get(Uri.parse('$BASE_URL?q=$cityName&appid=$apiKey&units=metric'));

      if(response.statusCode == 200){
        return Weather.fromJson(jsonDecode(response.body));
      } else{
        throw Exception('Failed to load weather data');
      }
    }
  }

}