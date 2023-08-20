import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irhib/binding/app_binding.dart';
import 'package:irhib/controllers/language_controller.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/ui/auth/signin.dart';
import 'package:irhib/traslation/local.dart';
import 'package:irhib/utils/app_helper.dart';
import 'package:irhib/utils/preferance_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferanceManager().InitPrefe();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LanguageController _controller = Get.put(LanguageController());
    print('LANG APP: ${AppHelper.getAppLanguage()}');
    return ScreenUtilInit(
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: MyLocal(),
        initialBinding: AppBinding(),
        locale: _controller.getAppLocle(),
        initialRoute: Routes.spalsh,
        getPages: AppRoutes.listRoutes,
      ),
    );
  }
}
