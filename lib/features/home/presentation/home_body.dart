import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/assets.dart';
import 'package:weather_app/core/widgets/custom_image.dart';
import 'package:weather_app/features/home/data/cubit/weather_data_cubit.dart';

import '../../../core/constants.dart';
import '../../../core/widgets/hour_weather.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        var weatherData = WeatherDataCubit.get(context);
        if (state is WeatherDataSuccess) {
          return Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_sharp,
                        size: 40,
                      ))),
              CustomImage(
                  assetImage: Assets.weatherSplash,
                  height: MediaQuery.sizeOf(context).height * .26),
              Text(
                "${weatherData.weatherModel?.current?.tempC}°",
                style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${weatherData.weatherModel?.current?.condition?.text}",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                  Text(
                    " (${weatherData.weatherModel?.location?.name})",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white54),
                  ),
                ],
              ),
              Text(
                "Max: ${weatherData.weatherModel?.forecast?.forecastday?[0].day?.maxtempC}°     Min: ${weatherData.weatherModel?.forecast?.forecastday?[0].day?.mintempC}°",
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
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 23),
                height: MediaQuery.sizeOf(context).height * .25,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(30)),
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
                        Text('${weatherData.weatherModel?.location?.localtime}',
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
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[5].tempC}°',
                            time:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[5].time}'),
                        const SizedBox(
                          width: 20,
                        ),
                        HourWeather(
                            tampC:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[10].tempC}°',
                            time:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[10].time}'),
                        const SizedBox(
                          width: 20,
                        ),
                        HourWeather(
                            tampC:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[15].tempC}°',
                            time:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[15].time}'),
                        const SizedBox(
                          width: 20,
                        ),
                        HourWeather(
                            tampC:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[20].tempC}°',
                            time:
                                '${weatherData.weatherModel?.forecast?.forecastday?[0].hour?[20].time}'),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
