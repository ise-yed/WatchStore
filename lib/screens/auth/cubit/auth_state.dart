part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class ErrorState extends AuthState {}

final class SentState extends AuthState {
  final String mobile;
  final String code;

  SentState({required this.mobile, required this.code});
}

final class VerifiedRegisterState extends AuthState {
  final String token;

  VerifiedRegisterState({required this.token});
}

final class LoggedInState extends AuthState {}

final class LoggedOutState extends AuthState {}
