part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {
  final String error;
  CartErrorState(this.error);
}

final class CartSuccessState extends CartState {
  final CartModel cartModel;

  CartSuccessState(this.cartModel);
}

final class CartItemDeleteState extends CartState {
  final CartModel cartModel;

  CartItemDeleteState(this.cartModel);
}

final class CartItemAddedState extends CartState {
  final CartModel cartModel;

  CartItemAddedState(this.cartModel);
}

final class CartItemRemoveState extends CartState {
  final CartModel cartModel;

  CartItemRemoveState(this.cartModel);
}

final class CartItemCountState extends CartState {}

final class RecivedPaymentLinkState extends CartState {
  final String url;
  RecivedPaymentLinkState(this.url);
}
