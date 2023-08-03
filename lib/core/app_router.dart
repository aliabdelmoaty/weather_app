import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/weather_model/weather_model.dart';
import 'package:weather_app/features/search/data/cubit/search_weather_cubit.dart';
import 'package:weather_app/features/search/presentation/search_screen.dart';
import 'package:weather_app/features/search/presentation/show_search_data.dart';

import '../features/home/presentation/home_screen.dart';
import '../features/splash/presentation/splash_screen.dart';

abstract class AppRouter {
  static const homeScreen = '/homeScreen';
  static const searchScreen = '/searchScreen';
  static const showSearchDataScreen = '/showSearchDataScreen';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: homeScreen,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: searchScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchWeatherCubit(),
        child: const SearchScreen(),
      ),
    ),
    GoRoute(
      path: showSearchDataScreen,
      builder: (context, state) => BlocProvider(
        create: (context) => SearchWeatherCubit(),
        child:  ShowSearchData(weatherModel: state.extra as WeatherModel),
      ),
    ),
  ]);
}
