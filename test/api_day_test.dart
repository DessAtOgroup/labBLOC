import 'package:flutterdemo2/Domain/Model/day.dart';
import 'package:test/test.dart';
import 'package:flutterdemo2/Data/api/Service/sunrise_service.dart';
import 'package:flutterdemo2/Data/api/api_util.dart';

void main() {
  Future<Day> VeryFuckingStrangeFunction() async {
    DateTime BlancDT = DateTime(0);
    Day d = Day(
        sunrise: BlancDT, sunset: BlancDT, solarNoon: BlancDT, dayLength: 0);
    return d;
  }

  ;

  test('какая-то хуйня', () {
    //Arrange
    SunriseService sr = SunriseService();
    final _apiday = ApiUtil(sr);
    //act

    dynamic d = _apiday.getDay(latitude: 0, longitude: 0);
    //accert

    expect(d.runtimeType, VeryFuckingStrangeFunction().runtimeType);
  });
}
