import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:medusa_flutter/medusa_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopsie/data/apiClient/api_client.dart';

import 'core/app_export.dart';

late Medusa medusa;
late SharedPreferences prefs;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  prefs = await SharedPreferences.getInstance();
  medusa = Medusa(Config(baseUrl: ApiClient.url));
  Logger.init(LogMode.debug);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'Shopsie',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      builder: EasyLoading.init(),
      theme: ThemeData(
        primaryColor: ColorConstant.indigoA200,
        scaffoldBackgroundColor: ColorConstant.whiteA700,
        brightness: Brightness.light,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: TextStyle(color: ColorConstant.indigoA200),
          ),
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: CupertinoColors.white,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.light,
              systemNavigationBarColor: Colors.white),
        ),
      ),
      getPages: AppRoutes.pages,
    );
  }
}
