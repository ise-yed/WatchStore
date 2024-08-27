part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class ProfileInit extends ProfileEvent {}

class ProfileAddressEvent extends ProfileEvent {}

class UserCancelledOrdersEvent extends ProfileEvent {}

class UserReceivedOrders extends ProfileEvent {}

class UserProcessingOrders extends ProfileEvent {}
