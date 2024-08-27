part of 'product_list_bloc.dart';

@immutable
sealed class ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListError extends ProductListState {
  final String error;

  ProductListError(this.error);
}

final class ProductListSuccess extends ProductListState {
  final List<ProductModel> productList;
  final List<BrandModel> brandList;

  ProductListSuccess(this.productList, this.brandList);
}
