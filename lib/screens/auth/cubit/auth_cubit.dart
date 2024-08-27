import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/utils/shared_preferences_constant.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial()) {
    SharedPreferencesManager().getString(SharedPreferencesConstant.token) ==
            null
        ? emit(LoggedOutState())
        : emit(LoggedInState());
  }

  final Dio _dio = Dio();

  sendSms(String mobile) async {
    String otpCode;
    emit(LoadingState());
    try {
      await _dio
          .post(ApiConstant.sendSms, data: {"mobile": mobile}).then((value) {
        debugPrint(value.toString());
        otpCode = value.data["data"]["code"].toString();
        if (value.statusCode == 201) {
          emit(SentState(mobile: mobile, code: otpCode));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }

  verifyCode(String mobile, String code) async {
    emit(LoadingState());
    try {
      await _dio.post(ApiConstant.checkSmsCode,
          data: {"mobile": mobile, "code": code}).then((value) async {
        debugPrint(value.toString());
        if (value.statusCode == 201 || value.statusCode == 200) {
          emit(VerifiedRegisterState(token: value.data["data"]["token"]));
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      emit(ErrorState());
    }
  }
}
