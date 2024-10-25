import 'package:weather/core/extensions/date_extensions.dart';
import 'package:flutter/material.dart';
import 'package:weather/l10n/app_localizations.dart';
import 'package:weather/ui/weekly_weather/models/weekly_weather_view_model.dart';

class WeeklyWeatherRow extends StatelessWidget {
  const WeeklyWeatherRow({
    super.key,
    required this.dayWeather,
  });

  final WeeklyWeatherViewModel dayWeather;

  static const _imageSize = 48.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final today = DateTime.now();
    String text = '';

    if (DateUtils.isSameDay(today, dayWeather.date)) {
      text = l10n.today;
    } else if (dayWeather.date.daysDifferenceFromToday == 1) {
      text = l10n.tomorrow;
    } else {
      text = dayWeather.date.dayAndMonth;
    }

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.memory(
          dayWeather.icon,
          width: _imageSize,
          height: _imageSize,
        ),
        Text(text),
        const Spacer(),
        Text('${dayWeather.minTemperature}º/${dayWeather.maxTemperature}º'),
      ],
    );
  }
}
