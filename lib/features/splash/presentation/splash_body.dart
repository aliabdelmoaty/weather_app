import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/app_router.dart';
import 'package:weather_app/core/assets.dart';
import '../../../core/widgets/custom_image.dart';

// ignore: must_be_immutable
class SplashBody extends StatelessWidget {
  SplashBody({super.key});
  LocationData? currentLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CustomImage(
          assetImage: Assets.weatherSplash,
          height: 300.h,
        ),
        SizedBox(
          height: 51.h,
        ),
        Text(
          "Weather",
          style: TextStyle(
              fontSize: 64.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text(
          "ForeCasts",
          style: TextStyle(
              fontSize: 64.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xffDDB130)),
        ),
        SizedBox(
          height: 51.h,
        ),
        Container(
          width: 200.w,
          decoration: BoxDecoration(
              color: const Color(0xffDDB130),
              borderRadius: BorderRadius.circular(50)),
          child: MaterialButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.homeScreen);
            },
            child: Text(
              "Get Start",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        // ConditionalBuilder(
        //     condition: state is! WeatherDataLoading,
        //     fallback: (context) =>
        //         const Center(child: CircularProgressIndicator()),
        //     builder: (context) {
        //       return
        //     })
      ],
    ));
  }
}
