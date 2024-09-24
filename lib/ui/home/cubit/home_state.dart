part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  data,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final HomeViewModel? homeViewModel;

  const HomeState({
    this.status = HomeStatus.initial,
    this.homeViewModel,
  });

  @override
  List<Object> get props => [
        status,
      ];

  HomeState copyWith({
    HomeStatus? status,
    HomeViewModel? homeViewModel,
  }) =>
      HomeState(
        status: status ?? this.status,
        homeViewModel: homeViewModel ?? this.homeViewModel,
      );
}
