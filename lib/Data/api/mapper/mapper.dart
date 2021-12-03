import 'package:flutterdemo2/Data/api/api_day.dart';
import 'package:flutterdemo2/Domain/Model/day.dart';

class DayMapper {
  static Day fromApi(ApiDay day) {
    return Day(
      sunrise: DateTime.tryParse(day.sunrise) ?? DateTime(0),
      sunset: DateTime.tryParse(day.sunset) ?? DateTime(0),
      solarNoon: DateTime.tryParse(day.solarNoon) ?? DateTime(0),
      dayLength: day.dayLength.toInt(),
    );
  }
}
