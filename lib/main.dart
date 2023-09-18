import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/core/app_router.dart';
import 'package:weather_app/features/home/data/cubit/weather_data_cubit.dart';

import 'core/constants.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(_ , child)=> BlocProvider(
        create: (context) => WeatherDataCubit()..getData(),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: primaryColor,
          ),
          title: 'Weather App',
          routerConfig: AppRouter.router,
        ),
      ),
    );
  }
}
