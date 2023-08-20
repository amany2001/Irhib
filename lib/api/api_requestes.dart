import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:irhib/api/api_helper.dart';
import 'package:irhib/model/home/ads.dart';
import 'package:irhib/model/auth.dart';
import 'package:irhib/model/cities.dart';
import 'package:irhib/model/countries.dart';
import 'package:irhib/model/services.dart';
import 'package:irhib/ui/home/pages/explore_page.dart';
import 'package:irhib/utils/app_helper.dart';

import '../model/explore.dart';
import '../model/main_home.dart';
import '../model/providers.dart';

class ApiRequest {
  static final _client = http.Client();

  static Future<Home?> getHomeDetails(String search,
      {required String language, required String? token}) async {
    //  https://erheb.smart-ab.com/api/tourists/home?search=gfdgdf&rate=1.2&price=500
    http.Response response = await _client.get(
        Uri.parse('${ApiHelper.TOURIST_Home}$search'),
        headers: ApiHelper.headers(language: language, token: token!));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Home home = Home.fromJson(body);
      return home;
    } else {
      print("Error in getHomeDetails: ${response.body}");
      return null;
    }
  }

  static Future<Ads?> getAdsDetails(
      {required String language, required String? token}) async {
    http.Response response = await _client.get(Uri.parse(ApiHelper.TOURIST_ADS),
        headers: ApiHelper.headers(language: language, token: token!));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Ads ads = Ads.fromJson(body);
      return ads;
    } else {
      print("Error in getAdsDetails: ${response.body}");
      return null;
    }
  }

  static Future<ExploreModel?> getExploreDetails(
      {required String language,
      required String? token,
      required String cityId}) async {
    http.Response response = await _client.get(
        Uri.parse("${ApiHelper.TOURIST_CITY_DETAILS}city_id=$cityId"),
        headers: ApiHelper.headers(language: language, token: token!));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      ExploreModel explore = ExploreModel.fromJson(body);
      // print('SUCCESS getExploreDetails: ${jsonEncode(explore)}');
      return explore;
    } else {
      print("Error in Explore Data: ${response.body}");
      return null;
    }
  }

  static Future<Countries?> getCountries({required String language}) async {
    print('LANG: ${language}');
    http.Response response = await _client.get(Uri.parse(ApiHelper.COUNTRIES),
        headers: ApiHelper.langHeader(language: language));
    // print('CODE: ${response.statusCode}');
    // print('BODY: ${jsonDecode(response.body)}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      //??|
      Countries countries = Countries.fromJson(body);
      // print('SUCCESS getCountries: ${jsonEncode(countries)}');
      return countries;
    } else {
      print('ERROR getCountries: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Cities?> getCities() async {
    http.Response cityResponse = await _client.get(Uri.parse(ApiHelper.CITIES));
    if (cityResponse.statusCode == 200) {
      var body = jsonDecode(cityResponse.body);
      Cities cities = Cities.fromJson(body);
      // print('SUCCESS getCountries: ${jsonEncode(cities)}');
      return cities;
    } else {
      print('ERROR getCountries: ${jsonDecode(cityResponse.body)}');
      return null;
    }
  }

  static Future<Services?> getServices() async {
    http.Response servicesResponse =
        await _client.get(Uri.parse(ApiHelper.SERVICES));
    if (servicesResponse.statusCode == 200) {
      var body = jsonDecode(servicesResponse.body);
      Services services = Services.fromJson(body);
      // print('SUCCESS getCountries: ${jsonEncode(services)}');
      return services;
    } else {
      print('ERROR getCountries: ${jsonDecode(servicesResponse.body)}');
      return null;
    }
  }

  static Future<Providers?> getProviders(
      {required int serviceId, required String token}) async {
    // print('SERVICEID: ${serviceId}');
    http.Response providersResponse = await _client.get(
        Uri.parse(
            '${ApiHelper.TOURIST_SERVICE_PROVIDERS}service_id=$serviceId'),
        headers: ApiHelper.headers(
            token: token, language: AppHelper.getAppLanguage()));

    if (providersResponse.statusCode == 200) {
      var body = jsonDecode(providersResponse.body);
      Providers providers = Providers.fromJson(body);
      print('SUCCESS getProviders: ${jsonEncode(providers)}');
      return providers;
    } else {
      print('ERROR getProviders: ${jsonDecode(providersResponse.body)}');
      return null;
    }
  }

  static Future<Auth?> registerTourists(
      {required String name,
      required int countryId,
      required String phone,
      required String email,
      required String password}) async {
    print('MAME: $name');
    http.Response response =
        await _client.post(Uri.parse(ApiHelper.TOURIST_REGISTER),
            headers: ApiHelper.header(),
            body: jsonEncode(<String, dynamic>{
              'name': name,
              'country_id': countryId,
              'email': email,
              'phone': phone,
              'status': '1',
              'password': password
            }),
            encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      print('SUCCCESS: ${jsonEncode(auth)}');
      return auth;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }

  static Future<Auth?> loginTourists(
      {required String email, required String password}) async {
    http.Response response = await _client.post(
        Uri.parse(ApiHelper.TOURIST_LOGIN),
        headers: ApiHelper.header(),
        body:
            jsonEncode(<String, dynamic>{'email': email, 'password': password}),
        encoding: Encoding.getByName('utf-8'));

    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Auth auth = Auth.fromJson(body);
      print('SUCCCESS: ${jsonEncode(auth)}');
      return auth;
    } else {
      print('ERROR: ${jsonDecode(response.body)}');
      return null;
    }
  }
}
