part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  data,
  failure,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final HomeViewModel? homeViewModel;

  const HomeState({
    this.status = HomeStatus.initial,
    this.homeViewModel,
  });

  @override
  List<Object?> get props => [
        status,
        homeViewModel,
      ];

  HomeState copyWith({
    HomeStatus? status,
    HomeViewModel? homeViewModel,
  }) =>
      HomeState(
        status: status ?? this.status,
        homeViewModel: homeViewModel ?? this.homeViewModel,
      );

  bool get hasWeatherData =>
      homeViewModel != null &&
      homeViewModel!.weatherDays.isNotEmpty &&
      homeViewModel!.weatherDays.first.weatherData.isNotEmpty;
}
