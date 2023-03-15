import 'package:dio/dio.dart';

final Dio dio = Dio()
  ..options.baseUrl = ''
  ..options.connectTimeout = const Duration(seconds: 5)
  ..options.receiveTimeout = const Duration(seconds: 3)
  ..interceptors.add(CustomInterceptor());

class CustomInterceptor extends Interceptor {
  //TODO: intercept request, response, error here.
}
