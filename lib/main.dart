import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:la_via/app_color.dart';
import 'package:la_via/cam/cam_cubit.dart';
import 'package:la_via/home/home_tap/managers/embedded_data_cubit.dart';
import 'package:la_via/home/report/managers/disease_cubit.dart';
import 'package:la_via/home/setting/managers/get_profile_data_cubit.dart';
import 'package:la_via/home_screen.dart';
import 'package:la_via/models/crops.dart';
import 'package:la_via/models/embeddedData.dart';
import 'package:la_via/provider/my_auth_cache.dart';
import 'package:la_via/provider/weatherProvider.dart';
import 'package:la_via/register/managers/login_cubit.dart';
import 'package:la_via/register/managers/signup_cubit.dart';
import 'package:la_via/screens/hourlyWeatherScreen.dart';
import 'package:la_via/screens/weeklyWeatherScreen.dart';
import 'package:la_via/splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyAuthCache.init();
  runApp(
    MultiBlocProvider(
      providers: [
        Provider<WeatherProvider>(create: (_) => WeatherProvider()),
        // Provider<CropsController>(create: (_) => CropsController()),
      ],
      child: const MyApp(),
    ),
  );
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
        BlocProvider(
          create: (context) => GetProfileDataCubit()..getProfileData(),
        ),
        BlocProvider(
          create: (context) => CamCubit(),
        ),
        BlocProvider(
          create: (context) => DiseaseCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppColor.lightTheme,
        title: 'La Via',
        home: const Splash(),
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
