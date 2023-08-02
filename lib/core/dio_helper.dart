import 'package:dio/dio.dart';

class DioHelper {
  final String baseUrl =
      "http://api.weatherapi.com/v1/forecast.json?key=cfb4bf72ad4546c6af4144448233007&days=1&aqi=yes&alerts=yes&q=";
  Dio dio = Dio();
  Future<Map<String, dynamic>> getData({required String endpoint}) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
