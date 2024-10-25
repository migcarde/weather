import 'dart:typed_data';

import 'package:flutter/material.dart';

class CurrentWeather extends StatelessWidget {
  const CurrentWeather({
    super.key,
    required this.degrees,
    required this.icon,
    required this.weather,
  });

  final int degrees;
  final Uint8List icon;
  final String weather;

  static const _imageSize = 48.0;
  static const _degreesFontSize = 80.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$degreesº',
          style: textTheme.displayLarge?.copyWith(
            fontSize: _degreesFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.memory(
              icon,
              width: _imageSize,
              height: _imageSize,
            ),
            Text(
              weather,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }
}
