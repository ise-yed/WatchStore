part of 'product_single_bloc.dart';

@immutable
sealed class ProductSingleState {}

final class ProductSingleLoading extends ProductSingleState {}

final class ProductSingleError extends ProductSingleState {
  final String error;

  ProductSingleError(this.error);
}

final class ProductSingleSuccess extends ProductSingleState {
  final ProductDetailsModel productDetailsModel;

  ProductSingleSuccess(this.productDetailsModel);
}
