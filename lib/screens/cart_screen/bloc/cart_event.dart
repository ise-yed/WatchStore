part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitEvent extends CartEvent {}

class CartCountItemEvent extends CartEvent {}

class AddToCartEvent extends CartEvent {
  final int productId;

  AddToCartEvent(this.productId);
}

class RemoveFromCartEvent extends CartEvent {
  final int productId;

  RemoveFromCartEvent(this.productId);
}

class DeleteFromCartEvent extends CartEvent {
  final int productId;

  DeleteFromCartEvent(this.productId);
}

class PaymentEvent extends CartEvent {}
