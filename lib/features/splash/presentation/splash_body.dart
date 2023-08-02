import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/app_router.dart';
import 'package:weather_app/core/assets.dart';
import 'package:weather_app/features/home/data/cubit/weather_data_cubit.dart';

import '../../../core/widgets/custom_image.dart';
import '../../../core/widgets/get_location.dart';

// ignore: must_be_immutable
class SplashBody extends StatelessWidget {
  SplashBody({super.key});
  LocationData? currentLocation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<WeatherDataCubit, WeatherDataState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            const CustomImage(
              assetImage: Assets.weatherSplash,
              height: 300,
            ),
            const SizedBox(
              height: 51,
            ),
            const Text(
              "Weather",
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              "ForeCasts",
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                  color: Color(0xffDDB130)),
            ),
            const SizedBox(
              height: 51,
            ),
            ConditionalBuilder(
                condition: state is! WeatherDataLoading,
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                builder: (context) {
                  return Container(
                    width: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xffDDB130),
                        borderRadius: BorderRadius.circular(50)),
                    child: MaterialButton(
                      onPressed: () {
                        getLocation().then((value) {
                          LocationData? location = value;
                          getAddress(location?.latitude, location?.longitude)
                              .then((value) {
                            currentLocation = location;
                            WeatherDataCubit.get(context)
                                .getData(endpoint: value);
                          }).then((value) {
                            GoRouter.of(context).push(AppRouter.homeScreen);
                          });
                        });
                      },
                      child: const Text(
                        "Get Start",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                })
          ],
        );
      },
    ));
  }
}
