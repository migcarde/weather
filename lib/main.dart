import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/app_theme.dart';
import 'package:weather/core/di/weather_di.dart';
import 'package:weather/core/locator.dart';
import 'package:weather/data/local/hive_adapters.dart';
import 'package:weather/ui/home/cubit/home_cubit.dart';
import 'package:weather/ui/location/location_widget.dart';

void main() async {
  await WeatherDi.init();
  await HiveAdapters.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.mainTheme(),
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) => locator<HomeCubit>()..init(),
            child: BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                switch (state.status) {
                  case HomeStatus.initial:
                    return const SizedBox();
                  case HomeStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case HomeStatus.data:
                    return LocationWidget(
                      location: state.homeViewModel?.locationName ?? 'Unknown',
                    );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
