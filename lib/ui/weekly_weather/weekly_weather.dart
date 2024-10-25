import 'package:flutter/widgets.dart';
import 'package:weather/core/constants/box_decoration_constants.dart';
import 'package:weather/ui/weekly_weather/models/weekly_weather_view_model.dart';
import 'package:weather/ui/weekly_weather/widgets/weekly_weather_row.dart';

class WeeklyWeather extends StatelessWidget {
  const WeeklyWeather({
    super.key,
    required this.weeklyWeather,
  });

  final List<WeeklyWeatherViewModel> weeklyWeather;

  static const _paddingHorizontal = 20.0;
  static const _paddingVertical = 12.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecorationConstants.roundedDecoration(),
      padding: const EdgeInsets.symmetric(
        horizontal: _paddingHorizontal,
        vertical: _paddingVertical,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => WeeklyWeatherRow(
          dayWeather: weeklyWeather[index],
        ),
        itemCount: weeklyWeather.length,
      ),
    );
  }
}
