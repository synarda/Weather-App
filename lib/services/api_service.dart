import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/const.dart';
import 'package:weather_app/models/weather_model.dart';

class ApiService {
  static Future<Dio> dioAuth(String place) async {
    BaseOptions options = BaseOptions(
        baseUrl: Const.API_URL,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        responseType: ResponseType.json,
        queryParameters: {"key": Const.API_KEY, "q": place, "aqi": "no"});

    return Dio(options);
  }

  static Future<WeatherModel?> getWeather(String place) async {
    try {
      Dio dio = await dioAuth(place);
      Response response = await dio.get("/v1/current.json");

      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      debugPrint("getWeather  DioError: $e");
    } catch (e) {
      debugPrint("getWeather  Error: $e");
    }
    return null;
  }
}
