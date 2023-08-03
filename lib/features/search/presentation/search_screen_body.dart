import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/core/app_router.dart';
import 'package:weather_app/features/search/data/cubit/search_weather_cubit.dart';

class SearchScreenBody extends StatelessWidget {
  const SearchScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<SearchWeatherCubit, SearchWeatherState>(
      listener: (context, state) {
        if (state is SearchWeatherError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('city not found')));
        }else if (state is SearchWeatherSuccess) {
          GoRouter.of(context).push(AppRouter.showSearchDataScreen,
          extra: state.weatherModel
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                cursorColor: Colors.black,
                onFieldSubmitted: (value) {
                  SearchWeatherCubit.get(context)
                      .searchCityNameChanged(city: value);
                  
                },
                autofocus: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'enter your city',
                    focusedBorder: buildOutLineBorder(),
                    enabledBorder: buildOutLineBorder(),
                    border: buildOutLineBorder()),
              ),
            ),
          ],
        );
      },
    ));
  }

  OutlineInputBorder buildOutLineBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.white));
  }
}
