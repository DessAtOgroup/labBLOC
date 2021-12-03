import 'package:flutterdemo2/Data/api/request/get_day_body.dart';
import 'package:flutterdemo2/Data/api/mapper/mapper.dart';
import 'package:meta/meta.dart';
import 'package:flutterdemo2/Data/api/Service/sunrise_service.dart';
import 'package:flutterdemo2/Domain/Model/day.dart';

class ApiUtil {
  final SunriseService _sunriseService;

  ApiUtil(this._sunriseService);

  Future<Day> getDay({
    @required double? latitude,
    @required double? longitude,
  }) async {
    if (latitude  == null)  {latitude  = 0;};
    if (longitude == null)  {longitude = 0;}
    final body = GetDayBody(latitude: latitude, longitude: longitude);

    final result = await _sunriseService.getDay(body);
    return DayMapper.fromApi(result);
  }
}