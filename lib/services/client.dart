import 'package:dio/dio.dart';

import '../configs/config.dart';

Dio dio = Dio();

class ClientService {
  static void config() {
    final options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );

    dio = Dio(options);
  }
}

class CustomInterceptor extends Interceptor {
  //TODO: intercept request, response, error here.
}
