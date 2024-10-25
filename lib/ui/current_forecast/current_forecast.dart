import 'package:flutter/material.dart';
import 'package:weather/core/constants/box_decoration_constants.dart';
import 'package:weather/core/extensions/date_extensions.dart';
import 'package:weather/l10n/app_localizations.dart';
import 'package:weather/ui/current_forecast/widgets/forecast_by_hour.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

class CurrentForecast extends StatelessWidget {
  const CurrentForecast({
    super.key,
    required this.weatherDetails,
  });

  final List<WeatherDetailsViewModel> weatherDetails;

  static const _containerHeight = 114.0;
  static const _paddingHorizontal = 20.0;
  static const _paddingVertical = 12.0;
  static const _separation = 10.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final today = DateTime.now();
    return Container(
      decoration: BoxDecorationConstants.roundedDecoration(),
      width: double.infinity,
      height: _containerHeight,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingHorizontal,
        vertical: _paddingVertical,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final weatherDetail = weatherDetails[index];
          final isCurrentTime = today.hour <= weatherDetail.time.hour &&
              today.hour >= (weatherDetail.time.hour - 3) &&
              DateUtils.isSameDay(today, weatherDetail.time);

          return ForecastByHour(
            hour:
                isCurrentTime ? l10n.today : weatherDetail.time.hoursAndMinutes,
            icon: weatherDetail.icon,
            temperature: weatherDetail.temperature.round(),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: _separation,
        ),
        itemCount: weatherDetails.length,
      ),
    );
  }
}
