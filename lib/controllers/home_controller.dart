import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irhib/ui/guide_app/add_tripe.dart';
import 'package:irhib/ui/home/pages/explore_page.dart';
import 'package:irhib/ui/home/pages/favorite_page.dart';
import 'package:irhib/ui/home/pages/main_home_page.dart';
import 'package:irhib/ui/home/pages/profile_page.dart';
import 'package:irhib/ui/home/toure_guide_profile.dart';

import '../model/home/home.dart';

class HomeController extends GetxController {
  late GlobalKey<ScaffoldState> drawerKey;

  List<Widget> listScreens = [
    MainHome(),
    Favorite(),
    Explore(),
    Profile(),
  ];

  List<Home> home = [
    Home(barIcon: Icon(Icons.home)),
    Home(barIcon: Icon(Icons.favorite)),
    Home(barIcon: Icon(Icons.explore)),
    Home(barIcon: Icon(Icons.person)),
  ];

  int currentIndex = 0;

  void getCurrentIndex(int index) {
    this.currentIndex = index;
    update();
  }

  @override
  void onInit() {
    drawerKey = GlobalKey();
    super.onInit();
  }

  @override
  void dispose() {
    drawerKey.currentState!.dispose();
    super.dispose();
  }
}
