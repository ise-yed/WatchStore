import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/data/model/user_model.dart';
import 'package:watch_store/utils/shared_preferences_manager.dart';

import '../../../component/text_style.dart';
import '../../../utils/shared_preferences_constant.dart';

part '../cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Dio _dio = Dio();

  pickLocation({required context}) async {
    await showSimplePickerLocation(
            isDismissible: true,
            contentPadding: const EdgeInsets.only(top: 5),
            titleWidget: Text(
              "انتخاب موقعیت مکانی",
              style: AppTextStyles.mainButton.apply(color: Colors.black),
              textAlign: TextAlign.right,
            ),
            textCancelPicker: "لغو",
            textConfirmPicker: "انتخاب",
            zoomOption: const ZoomOption(initZoom: 8.0),
            initPosition: GeoPoint(latitude: 36.341194, longitude: 59.586361),
            //initCurrentUserPosition: UserTrackingOption.,
            radius: 12,
            context: context)
        .then((value) => emit(LocationPickedState(location: value)));
  }

  register({required UserModel user, required String userToken}) async {
    emit(LoadingState());
    try {
      SharedPreferencesManager()
          .saveString(SharedPreferencesConstant.token, userToken);
      String? token =
          SharedPreferencesManager().getString(SharedPreferencesConstant.token);

      debugPrint(token.toString());

      _dio.options.headers['Authorization'] = "Bearer $token";
      await _dio
          .post(
        ApiConstant.register,
        data: user.toMap(),
      )
          .then((value) {
        debugPrint(value.data.toString());
        debugPrint(value.statusCode.toString());
        if (value.statusCode == 201) {
          emit(OkRegisteredState());
        } else {
          debugPrint(value.statusCode!.toString());
          emit(ErrorState());
        }
      });
    } catch (e) {
      debugPrint(e.toString());
      emit(ErrorState());
    }
  }
}
