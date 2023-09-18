import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../assets.dart';
import 'custom_image.dart';

class HourWeather extends StatelessWidget {
  const HourWeather({
    super.key,
    required this.tampC,
    required this.time,
  });

  final String tampC;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tampC,
          style:  TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white),
        ),
         SizedBox(
            height: 65.h,
            width: 60.w,
            child: CustomImage(assetImage: Assets.weatherSplash, height: 40.h)),
         SizedBox(
          height: 5.h,
        ),
        Text(
          time.substring(16 - 5),
          style:  TextStyle(
              fontSize: 20.sp, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    );
  }
}
