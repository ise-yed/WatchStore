part of 'product_list_bloc.dart';

@immutable
sealed class ProductListEvent {}

class ProductListByCat extends ProductListEvent {
  final int catId;

  ProductListByCat(this.catId);
}

class ProductListByBrand extends ProductListEvent {
  final int brandId;

  ProductListByBrand(this.brandId);
}

class ProductListSorted extends ProductListEvent {
  final String sortParam;

  ProductListSorted(this.sortParam);
}

class ProductListBySearch extends ProductListEvent {
  final String searchKey;

  ProductListBySearch(this.searchKey);
}
