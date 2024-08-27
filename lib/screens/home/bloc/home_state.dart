part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoading extends HomeState {}

final class HomeError extends HomeState {
  final String error;
  HomeError(this.error);
}

final class HomeSuccess extends HomeState {
  final HomeModel home;

  HomeSuccess(this.home);
}
