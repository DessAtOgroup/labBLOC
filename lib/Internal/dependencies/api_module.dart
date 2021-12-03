
import 'package:flutterdemo2/Data/api/api_util.dart';
import 'package:flutterdemo2/Data/api/Service/sunrise_service.dart';

class ApiModule {
  static ApiUtil? _apiUtil;

  static ApiUtil apiUtil() {
    if (_apiUtil == null) {
      _apiUtil = ApiUtil(SunriseService());
    }
    return _apiUtil! ;
  }
}