import 'package:weather/core/locator.dart';
import 'package:weather/ui/home/cubit/home_cubit.dart';

class CubitsDi {
  static void init() {
    locator.registerLazySingleton(
      () => HomeCubit(
        getWeather: locator(),
        saveWeather: locator(),
        locationService: locator(),
      ),
    );
  }
}
