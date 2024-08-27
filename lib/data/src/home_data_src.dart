import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/data/model/home_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IHomeDataSrc {
  Future<HomeModel> getHome();
}

class HomeRemoteDataSrc implements IHomeDataSrc {
  final Dio httpClient;
  HomeRemoteDataSrc(this.httpClient);

  @override
  Future<HomeModel> getHome() async {
    final HomeModel home;
    final response = await httpClient.get(ApiConstant.home);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    home = HomeModel.fromJson(response.data['data']);
    return home;
  }
}
