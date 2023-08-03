import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.homeScreen);
                },
                icon: const Icon(
                  Icons.home_rounded,
                  size: 40,
                )),
            const Spacer(),
            IconButton(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.searchScreen);
                },
                icon: const Icon(
                  Icons.search_sharp,
                  size: 40,
                )),
          ],
        ),
        CustomImage(
            assetImage: Assets.weatherSplash,
            height: MediaQuery.sizeOf(context).height * .26),
        Text(
          "${weatherModel.current?.tempC}°",
          style: const TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${weatherModel.current?.condition?.text}",
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            Text(
              " (${weatherModel.location?.name})",
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54),
            ),
          ],
        ),
        Text(
          "Max: ${weatherModel.forecast?.forecastday?[0].day?.maxtempC}°     Min: ${weatherModel.forecast?.forecastday?[0].day?.mintempC}°",
          style: const TextStyle(
              fontSize: 24,
              height: 1.5,
              fontWeight: FontWeight.w400,
              color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomImage(
            assetImage: Assets.house,
            height: MediaQuery.sizeOf(context).height * .13),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 23),
          height: MediaQuery.sizeOf(context).height * .25,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "today",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Text('${weatherModel.location?.localtime}',
                      style: const TextStyle(
                          fontSize: 20,
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
                  const SizedBox(
                    width: 20,
                  ),
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[10].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[10].time}'),
                  const SizedBox(
                    width: 20,
                  ),
                  HourWeather(
                      tampC:
                          '${weatherModel.forecast?.forecastday?[0].hour?[15].tempC}°',
                      time:
                          '${weatherModel.forecast?.forecastday?[0].hour?[15].time}'),
                  const SizedBox(
                    width: 20,
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
