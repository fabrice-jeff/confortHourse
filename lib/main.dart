import 'package:conforthourse/colors.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/demarcheurs/add_annonce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserLogin()),
      ],
      child: GetMaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        debugShowCheckedModeBanner: false,
        home: AddAnnoncePage(),
      ),
    );
  }
}
