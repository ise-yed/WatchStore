import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/data/model/cart_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class ICartDataSrc {
  Future<CartModel> getUserCart();

  Future<CartModel> addToCart({required int productId});

  Future<CartModel> removeFromCart({required int productId});

  Future<CartModel> deleteFromCart({required int productId});

  Future<int> countCartItem();

  Future<String> paymentCart();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;

  CartRemoteDataSrc(this.httpClient);

  @override
  Future<CartModel> addToCart({required int productId}) async =>
      await httpClient.post(ApiConstant.addToCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return CartModel.fromJson(value.data['data']);
      });

  @override
  Future<CartModel> deleteFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.deleteFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return CartModel.fromJson(value.data['data']);
      });

  @override
  Future<CartModel> getUserCart() async {
    final response = await httpClient.post(ApiConstant.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return CartModel.fromJson(response.data['data']);
  }

  @override
  Future<CartModel> removeFromCart({required int productId}) async =>
      await httpClient.post(ApiConstant.removeFromCart,
          data: {'product_id': productId}).then((value) {
        HttpResponseValidator.isValidStatusCode(value.statusCode ?? 0);
        return CartModel.fromJson(value.data['data']);
      });

  @override
  Future<int> countCartItem() async {
    final response = await httpClient.post(ApiConstant.userCart);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return (response.data['data']['user_cart'] as List).length;
  }

  @override
  Future<String> paymentCart() async {
    final response = await httpClient.post(ApiConstant.payment);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return response.data['action'];
  }
}
