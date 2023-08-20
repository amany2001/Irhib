import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/splashcontroller.dart';
import 'package:irhib/utils/constants.dart';
import 'package:irhib/utils/preferance_manager.dart';

class SplashScreen extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    // PreferanceManager.clearAll();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '${Const.images}logo.svg',
                height: 127,
                width: 121,
              )
            ],
          ),
        ),
      ),
    );
  }
}
