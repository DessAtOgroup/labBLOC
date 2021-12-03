import 'package:flutter/cupertino.dart';
import 'package:flutterdemo2/Data/api/api_util.dart';
import 'package:flutterdemo2/Domain/Model/day.dart';
import 'package:flutterdemo2/Domain/Repository/day_repository.dart';

class DayDataRepository extends DayRepository {
  final ApiUtil _apiUtil;

  DayDataRepository(this._apiUtil);

  @override
  Future<Day> getDay({
    @required double? latitude,
    @required double? longitude}) {
    return _apiUtil.getDay(latitude: latitude, longitude: longitude);
  }
}