part of 'product_single_bloc.dart';

@immutable
sealed class ProductSingleEvent {}

class ProductSingleInit extends ProductSingleEvent {
  final int id;

  ProductSingleInit(this.id);
}
