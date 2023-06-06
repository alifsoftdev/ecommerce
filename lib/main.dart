import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kallukoshai/states/data/routes.dart';
import 'package:kallukoshai/view/ui/screens/splash/splash.dart';

import 'constants/colors.dart';
import 'states/bindings/bindings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      'pk_test_51M4JctDyI9CyAnKqIo9hzEC7vf9LTpmZ4MxHbxAf9GX5LKHRBYjpv7Jot9UuJOHE4WFGV3a2q2yErvj753j7MAe200IXIwtymu';

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: ConstantColors.white,
            progressIndicatorTheme: ProgressIndicatorThemeData(
              color: ConstantColors.lightGray,
            ),
          ),
          debugShowCheckedModeBanner: false,
          getPages: AllRoutes.allRoutes,
          initialRoute: SplashScreen.routeName,
          initialBinding: InitialBinding(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
