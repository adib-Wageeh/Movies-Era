import 'package:dio/dio.dart';

class ApiServices{

  final _baseUrl = "https://api.themoviedb.org/3/";
  final _apiKey = "api_key=0cd4f8e0b7fd2d10430cb6651fd65f9d";
  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint})async{
    final response = await _dio.get("$_baseUrl$endPoint$_apiKey");
    return response.data;
  }

}