import 'package:flutter/cupertino.dart';
import 'package:watch_store/data/config/remote_config.dart';
import 'package:watch_store/data/model/cart_model.dart';

import '../src/cart_data_src.dart';

abstract class ICartRepo {
  Future<CartModel> getUserCart();

  Future<CartModel> addToCart({required int productId});

  Future<CartModel> removeFromCart({required int productId});

  Future<CartModel> deleteFromCart({required int productId});

  Future<int> countCartItem();

  Future<String> paymentCart();
}

class CartRepository extends ICartRepo {
  final ICartDataSrc _iCartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);

  CartRepository(this._iCartDataSrc);

  @override
  Future<CartModel> addToCart({required int productId}) =>
      _iCartDataSrc.addToCart(productId: productId).then((value) {
        cartCount.value = value.userCart!.length;
        return value;
      });

  @override
  Future<CartModel> deleteFromCart({required int productId}) =>
      _iCartDataSrc.deleteFromCart(productId: productId).then((value) {
        cartCount.value = value.userCart!.length;
        return value;
      });

  @override
  Future<CartModel> getUserCart() => _iCartDataSrc.getUserCart();

  @override
  Future<CartModel> removeFromCart({required int productId}) =>
      _iCartDataSrc.removeFromCart(productId: productId).then((value) {
        cartCount.value = value.userCart!.length;
        return value;
      });

  @override
  Future<int> countCartItem() =>
      _iCartDataSrc.countCartItem().then((value) => cartCount.value = value);

  @override
  Future<String> paymentCart() => _iCartDataSrc.paymentCart();
}

final cartRepository = CartRepository(CartRemoteDataSrc(DioManager.dio));
