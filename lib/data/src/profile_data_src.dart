import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/data/model/address_model.dart';
import 'package:watch_store/data/model/order_model.dart';
import 'package:watch_store/utils/response_validator.dart';

import '../model/profile_model.dart';

abstract class IProfileDataSrc {
  Future<ProfileModel> getUserProfile();

  Future<AddressModel> getUserAddress();

  Future<List<OrderModel>> getUserCancelledOrders();

  Future<List<OrderModel>> getUserReceivedOrders();

  Future<List<OrderModel>> getUserProcessingOrders();
}

class ProfileRemoteDataSrc implements IProfileDataSrc {
  final Dio httpClient;

  ProfileRemoteDataSrc(this.httpClient);

  @override
  Future<AddressModel> getUserAddress() async {
    final response = await httpClient.post(ApiConstant.userAddresses);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return AddressModel.fromJson(response.data['data'][0]);
  }

  @override
  Future<List<OrderModel>> getUserCancelledOrders() async {
    List<OrderModel> orderList = <OrderModel>[];
    final response = await httpClient.post(ApiConstant.userCancelledOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data'] as List)) {
      orderList.add(OrderModel.fromJson(element));
    }
    return orderList;
  }

  @override
  Future<List<OrderModel>> getUserProcessingOrders() async {
    List<OrderModel> orderList = <OrderModel>[];
    final response = await httpClient.post(ApiConstant.userProcessingOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data'] as List)) {
      orderList.add(OrderModel.fromJson(element));
    }
    return orderList;
  }

  @override
  Future<ProfileModel> getUserProfile() async {
    final response = await httpClient.post(ApiConstant.profile);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return ProfileModel.fromJson(response.data['data']);
  }

  @override
  Future<List<OrderModel>> getUserReceivedOrders() async {
    List<OrderModel> orderList = <OrderModel>[];
    final response = await httpClient.post(ApiConstant.userReceivedOrders);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['data'] as List)) {
      orderList.add(OrderModel.fromJson(element));
    }
    return orderList;
  }
}
