import 'package:flutter/material.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home/home_tap.dart';
import 'package:la_via/home_screen.dart';
import 'package:la_via/splash.dart';
import 'package:la_via/start/add_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Via',
      theme: AppColor.lightTheme,
      routes: {
        Splash.routeName: (buildContext) => const Splash(),
        HomeScreen.routeName: (buildContext) => const HomeScreen(),
        AddField.routeName: (buildContext) => const AddField(),
        HomeTap.routeName: (buildContext) => const HomeTap(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
