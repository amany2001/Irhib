import 'package:irhib/model/language.dart';

class ApiHelper {
  static const String _baseUrl = 'https://erheb.smart-ab.com/api';

  static const String COUNTRIES = '$_baseUrl/countries';
  static const String CITIES = '$_baseUrl/cities';
  static const String SERVICES = '$_baseUrl/services';

  static const String TOURIST_REGISTER = '$_baseUrl/auth/tourists/register';
  static const String TOURIST_LOGIN = '$_baseUrl/auth/tourists/login';
  static const String TOURIST_Home = '$_baseUrl/tourists/home?search=';
  static const String TOURIST_ADS = '$_baseUrl/tourists/getAds';
  static const String TOURIST_CITY_DETAILS = '$_baseUrl/tourists/cityDetails?';
  static const String TOURIST_SERVICE_PROVIDERS =
      '$_baseUrl/tourists/service-providers?';

  static Map<String, String> header() {
    return {'Content-Type': 'application/json'};
  }

  static Map<String, String> langHeader({required String language}) {
    return {'Accept-Language': language};
  }

  static Map<String, String> headers(
      {required String token, required String language}) {
    return {'Authorization': token, 'Accept-Language': language};
  }
}
