import 'package:flutter/material.dart';

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
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
            height: 65,
            width: 60,
            child: CustomImage(assetImage: Assets.weatherSplash, height: 40)),
        const SizedBox(
          height: 5,
        ),
        Text(
          time.substring(16 - 5),
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        )
      ],
    );
  }
}
