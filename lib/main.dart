import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/pages.dart';
import 'utils/colors.dart';
import 'utils/share_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharePreferences.init();
  return runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPage.initial,
      getPages: AppPage.routes,
      // home: HomeScreen(),
    );
  }
}
