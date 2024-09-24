import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/domain/base/base_use_case.dart';
import 'package:weather/domain/operations/get_weather.dart';
import 'package:weather/domain/operations/weather_repository.dart';
import 'package:weather/ui/home/models/home_view_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.getWeather,
  }) : super(const HomeState());

  final GetWeather getWeather;

  Future<void> init() async {
    final weatherFromLocale = await getWeather(NoParams());

    if (weatherFromLocale != null) {
      // TODO: Set weather in home
      // TODO: Get weather from remote
    } else {
      emit(
        state.copyWith(
          status: HomeStatus.loading,
        ),
      );
      // TODO: Get data from remote
    }
  }
}
