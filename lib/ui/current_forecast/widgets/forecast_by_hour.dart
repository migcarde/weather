import 'dart:typed_data';

import 'package:flutter/material.dart';

class ForecastByHour extends StatelessWidget {
  const ForecastByHour({
    super.key,
    required this.hour,
    required this.icon,
    required this.temperature,
  });

  final String hour;
  final Uint8List icon;
  final int temperature;

  static const _imageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          hour,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Image.memory(
          icon,
          width: _imageSize,
          height: _imageSize,
        ),
        Text('$temperature°'),
      ],
    );
  }
}
