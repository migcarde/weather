import 'package:flutter/material.dart';
import 'package:weather/core/constants/color_constants.dart';

class BoxDecorationConstants {
  static BoxDecoration roundedDecoration({
    Color backgroundColor = ColorConstants.cardColor,
  }) =>
      BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(
          24.0,
        ),
      );
}
