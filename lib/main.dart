import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/home_screen.dart';
import 'package:la_via/provider/weatherProvider.dart';
import 'package:la_via/register/managers/login_cubit.dart';
import 'package:la_via/register/managers/signup_cubit.dart';
import 'package:la_via/screens/hourlyWeatherScreen.dart';
import 'package:la_via/screens/landing_page.dart';
import 'package:la_via/screens/weeklyWeatherScreen.dart';
import 'package:la_via/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppColor.lightTheme,
        title: 'La Via',
        home: Splash(),
        routes: {
          Splash.routeName: (buildContext) => const Splash(),
          HomeScreen.routeName: (buildContext) => HomeScreen(),
          WeeklyScreen.routeName: (myCtx) => WeeklyScreen(),
          HourlyScreen.routeName: (myCtx) => HourlyScreen(),
        },
      ),
    );
  }
}
