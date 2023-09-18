import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/app_router.dart';
import 'package:weather_app/core/assets.dart';
import 'package:weather_app/core/weather_model/weather_model.dart';
import 'package:weather_app/core/widgets/custom_image.dart';
import '../../../core/constants.dart';
import '../../../core/widgets/hour_weather.dart';

class ShowSearchDataBody extends StatelessWidget {
  const ShowSearchDataBody({super.key, required this.weatherModel});
  final WeatherModel weatherModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            IconButton(
                color: Colors.white,
                padding:  EdgeInsets.symmetric(horizontal: 12.w),
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.homeScreen);
                },
                icon:  Icon(
                  Icons.home_rounded,
                  size: 40.h,
                )),
            const Spacer(),
            IconButton(
                color: Colors.white,
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.searchScreen);
                },
                icon:  Icon(
                  Icons.search_sharp,
                  size: 40.h,
                )),
          ],
        ),
        CustomImage(
            assetImage: Assets.weatherSplash,
            height: MediaQuery.sizeOf(context).height * .26),
        Text(
          "${weatherModel.current?.tempC}°",
          style:  TextStyle(
              fontSize: 50.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${weatherModel.current?.condition?.text}",
              style:  TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Text(
              " (${weatherModel.location?.name})",
              style:  TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54),
            ),
          ],
        ),
        Text(
          "Max: ${weatherModel.forecast?.forecastday?[0].day?.maxtempC}°     Min: ${weatherModel.forecast?.forecastday?[0].day?.mintempC}°",
          style:  TextStyle(
              fontSize: 24.sp,
              height: 1.5.h,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
         SizedBox(
          height: 30.h,
        ),
        CustomImage(
            assetImage: Assets.house,
            height: MediaQuery.sizeOf(context).height * .13),
        Container(
          padding:  EdgeInsets.symmetric(vertical: 5.h, horizontal: 23.w),
          height: MediaQuery.sizeOf(context).height * .25,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Row(
                children: [
                   Text(
                    "today",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Text('${weatherModel.location?.localtime}',
                      style:  TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[5].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[5].time}'),
                   SizedBox(
                    width: 20.w,
                  ),
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[10].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[10].time}'),
                   SizedBox(
                    width: 20.w,
                  ),
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[15].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[15].time}'),
                   SizedBox(
                    width: 20.w,
                  ),
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[20].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[20].time}'),
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}
