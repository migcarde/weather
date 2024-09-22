import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/location_service.dart';
import 'package:weather/ui/location/cubit/location_cubit.dart';
import 'package:weather/ui/location/location_widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: BlocProvider(
            create: (context) => LocationCubit(
              locationService: LocationService(),
            )..getLocation(),
            child: BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                switch (state.status) {
                  case LocationStatus.loading:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case LocationStatus.data:
                    return LocationWidget(
                      location: state.location?.locality ?? 'Unknown',
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
