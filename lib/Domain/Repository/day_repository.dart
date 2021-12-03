import 'package:meta/meta.dart';
import 'package:flutterdemo2/Domain/Model/day.dart';

abstract class DayRepository {
  Future<Day> getDay({
  @required double latitude,
  @required double longitude
});

}