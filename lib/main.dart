import 'package:conforthourse/colors.dart';
import 'package:conforthourse/providers/user_login.dart';
import 'package:conforthourse/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
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
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.backgroundColor),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
