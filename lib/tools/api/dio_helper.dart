import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://perenual.com',
        receiveDataWhenStatusError: true,
        headers: {},
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    // int? page,
  }) async
  {
    dio.options.headers =
    {

    };


    return await dio.get(
      url,
      queryParameters: query,
    );
  }

}
