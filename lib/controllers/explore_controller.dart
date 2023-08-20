import 'dart:convert';
import 'package:get/get.dart';
import 'package:irhib/model/providers.dart';
import '../api/api_requestes.dart';
import '../model/explore.dart';
import '../utils/app_helper.dart';

class ExploreController extends GetxController {
  ExploreData exolpre = ExploreData();

  int providerId = 0;

  List<ProvidersData> listServiceProviders = [];

  Future<void> fetchExploreDetails(String cityId) async {
    await ApiRequest.getExploreDetails(
      cityId: cityId,
      language: AppHelper.getAppLanguage(),
      token: AppHelper.getUserToken(),
    ).then((value) {
      if (value != null) {
        exolpre = value.exploreData!;
        providerId = exolpre.servicesProvider![0].id!;
        print('PROVIDEERS: ${jsonEncode(exolpre.servicesProvider)}');
      }
    });
  }

  Future<void> fetchServiceProviders({required int serviceId}) async {
    await ApiRequest.getProviders(
            serviceId: serviceId, token: AppHelper.getUserToken()!)
        .then((value) {
      if (value != null) {
        listServiceProviders.clear();
        listServiceProviders.addAll(value.data!.providers!);
        update();
      }
    });
  }
}
