import 'package:dio/dio.dart';
import 'package:watch_store/data/model/home_model.dart';
import 'package:watch_store/data/src/home_data_src.dart';

abstract class IHomeRepo {
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepo {
  final IHomeDataSrc _homeDataSrc;

  HomeRepository(this._homeDataSrc);

  @override
  Future<HomeModel> getHome() => _homeDataSrc.getHome();
}

final homeRepository = HomeRepository(HomeRemoteDataSrc(Dio()));
