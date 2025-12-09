import 'package:dio/dio.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummy.restapiexample.com/api/v1/",
      connectTimeout: Duration(seconds: 10),
    ),
  );
}
