import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/address_model.dart';
import 'package:watch_store/data/model/order_model.dart';

import '../../../data/model/profile_model.dart';
import '../../../data/repo/profile_repo.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepo _iProfileRepo;

  ProfileBloc(this._iProfileRepo) : super(ProfileLoading()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileInit) {
        try {
          emit(ProfileLoading());
          final response = await _iProfileRepo.getUserProfile();
          emit(ProfileSuccess(response));
        } catch (e) {
          // emit(ProfileError("خطا در دریافت اطلاعات حساب کاربری"));
          emit(ProfileError(e.toString()));
        }
      }
      if (event is ProfileAddressEvent) {
        try {
          emit(ProfileAddressLoading());
          final response = await _iProfileRepo.getUserAddress();
          emit(ProfileAddressSuccess(response));
        } catch (e) {
          // emit(ProfileAddressError('خطا در بارگذاری آدرس'));
          emit(ProfileAddressError(e.toString()));
        }
      }
      if (event is UserProcessingOrders) {
        try {
          emit(UserProcessingOrderLoading());
          final response = await _iProfileRepo.getUserProcessingOrders();
          emit(UserProcessingOrderSuccess(response));
        } catch (e) {
          emit(UserProcessingOrderError(e.toString()));
          // emit(UserOrderError('error'));
        }
      }
      if (event is UserCancelledOrdersEvent) {
        try {
          emit(UserCancelledOrderLoading());
          final response = await _iProfileRepo.getUserCancelledOrders();
          emit(UserCancelledOrderSuccess(response));
        } catch (e) {
          emit(UserCancelledOrderError(e.toString()));
          // emit(UserOrderError('error'));
        }
      }
      if (event is UserReceivedOrders) {
        try {
          emit(UserReceivedOrderLoading());
          final response = await _iProfileRepo.getUserReceivedOrders();
          emit(UserReceivedOrderSuccess(response));
        } catch (e) {
          emit(UserReceivedOrderError(e.toString()));
          // emit(UserOrderError('error'));
        }
      }
    });
  }
}
