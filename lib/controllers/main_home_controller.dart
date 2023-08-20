import 'package:get/get.dart';
import 'package:irhib/api/api_requestes.dart';
import 'package:irhib/model/home/ads.dart';
import 'package:irhib/model/main_home.dart';
import 'package:irhib/utils/app_helper.dart';

class MainHomeController extends GetxController {
  List<HomeData> listHomeDetails = [];
  List<AdsData> listAdsDetails = [];

  Future<void> fetchHomeDetails(String search) async {
    await ApiRequest.getHomeDetails(
      search,
      language: AppHelper.getAppLanguage(),
      token: AppHelper.getUserToken(),
    ).then((value) {
      if (value != null) {
        listHomeDetails.clear();
        listHomeDetails.addAll(value.homeDetails!);
        update();
      }
    });
    update();
  }

  Future<void> fetchAdsDetails() async {
    await ApiRequest.getAdsDetails(
      language: AppHelper.getAppLanguage(),
      token: AppHelper.getUserToken(),
    ).then((value) {
      if (value != null) {
        listAdsDetails.clear();
        listAdsDetails.addAll(value.adsData!);
      }
    });
  }
}
