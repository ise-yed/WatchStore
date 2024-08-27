import 'package:watch_store/data/config/remote_config.dart';
import 'package:watch_store/data/model/address_model.dart';
import 'package:watch_store/data/model/order_model.dart';
import 'package:watch_store/data/src/profile_data_src.dart';
import '../model/profile_model.dart';

abstract class IProfileRepo {
  Future<ProfileModel> getUserProfile();

  Future<AddressModel> getUserAddress();

  Future<List<OrderModel>> getUserCancelledOrders();

  Future<List<OrderModel>> getUserReceivedOrders();

  Future<List<OrderModel>> getUserProcessingOrders();
}

class ProfileRepository implements IProfileRepo {
  final IProfileDataSrc _iProfileDataSrc;

  ProfileRepository(this._iProfileDataSrc);

  @override
  Future<AddressModel> getUserAddress() => _iProfileDataSrc.getUserAddress();

  @override
  Future<List<OrderModel>> getUserCancelledOrders() =>
      _iProfileDataSrc.getUserCancelledOrders();

  @override
  Future<List<OrderModel>> getUserProcessingOrders() =>
      _iProfileDataSrc.getUserProcessingOrders();

  @override
  Future<ProfileModel> getUserProfile() => _iProfileDataSrc.getUserProfile();

  @override
  Future<List<OrderModel>> getUserReceivedOrders() =>
      _iProfileDataSrc.getUserReceivedOrders();
}

final profileRepository =
    ProfileRepository(ProfileRemoteDataSrc(DioManager.dio));
