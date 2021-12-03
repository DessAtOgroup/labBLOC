import 'package:dio/dio.dart';
import 'package:flutterdemo2/Data/api/api_day.dart';
import 'package:flutterdemo2/Data/api/request/get_day_body.dart';
import 'package:meta/meta.dart';

class SunriseService {
  static const _BASE_URL = 'https://api.sunrise-sunset.org';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<ApiDay> getDay(GetDayBody body) async {
     final response = await _dio.get(
      '/json',
      queryParameters: body.toApi(),
    );
    return ApiDay.fromApi(response.data);
  }
}