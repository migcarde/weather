import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/core/constants/box_decoration_constants.dart';
import 'package:weather/l10n/app_localizations.dart';
import 'package:weather/ui/current_forecast/widgets/forecast_by_hour.dart';
import 'package:weather/ui/home/models/weather_details_view_model.dart';

class CurrentForecast extends StatelessWidget {
  const CurrentForecast({
    super.key,
    required this.weatherDetails,
  });

  final List<WeatherDetailsViewModel> weatherDetails;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final today = DateTime.now();
    return Container(
      decoration: BoxDecorationConstants.roundedContainer(),
      width: double.infinity,
      height: 114.0,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 12.0,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final weatherDetail = weatherDetails[index];
          final isCurrentTime = today.hour <= weatherDetail.time.hour &&
              today.hour >= (weatherDetail.time.hour - 3) &&
              DateUtils.isSameDay(today, weatherDetail.time);

          final dateFormat = DateFormat.Hm();
          final time = dateFormat.format(weatherDetail.time);

          return ForecastByHour(
            hour: isCurrentTime ? l10n.today : time,
            icon: weatherDetail.icon,
            temperature: weatherDetail.temperature.round(),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10.0,
        ),
        itemCount: weatherDetails.length,
      ),
    );
  }
}
