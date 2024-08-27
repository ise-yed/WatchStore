part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileError extends ProfileState {
  final String error;

  ProfileError(this.error);
}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess(this.profileModel);
}

/////////////////////////////////////////////////////////

final class ProfileAddressLoading extends ProfileState {}

final class ProfileAddressError extends ProfileState {
  final String error;

  ProfileAddressError(this.error);
}

final class ProfileAddressSuccess extends ProfileState {
  final AddressModel addressModel;

  ProfileAddressSuccess(this.addressModel);
}

/////////////////////////////////////////////////////////

final class UserProcessingOrderLoading extends ProfileState {}

final class UserProcessingOrderError extends ProfileState {
  final String error;

  UserProcessingOrderError(this.error);
}

final class UserProcessingOrderSuccess extends ProfileState {
  final List<OrderModel> orderList;

  UserProcessingOrderSuccess(this.orderList);
}

/////////////////////////////////////////////////////////

final class UserCancelledOrderLoading extends ProfileState {}

final class UserCancelledOrderError extends ProfileState {
  final String error;

  UserCancelledOrderError(this.error);
}

final class UserCancelledOrderSuccess extends ProfileState {
  final List<OrderModel> orderList;

  UserCancelledOrderSuccess(this.orderList);
}

/////////////////////////////////////////////////////////

final class UserReceivedOrderLoading extends ProfileState {}

final class UserReceivedOrderError extends ProfileState {
  final String error;

  UserReceivedOrderError(this.error);
}

final class UserReceivedOrderSuccess extends ProfileState {
  final List<OrderModel> orderList;

  UserReceivedOrderSuccess(this.orderList);
}