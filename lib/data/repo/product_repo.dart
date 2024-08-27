import 'package:dio/dio.dart';
import 'package:watch_store/data/model/brand_model.dart';
import 'package:watch_store/data/model/product_details_model.dart';
import 'package:watch_store/data/model/product_model.dart';
import 'package:watch_store/data/src/product_data_src.dart';

abstract class IProductRepo {
  Future<ProductDetailsModel> getProductDetails(int id);

  Future<List<ProductModel>> getAllByCategory(int id);

  Future<List<ProductModel>> getAllByBrand(int id);

  Future<List<ProductModel>> getSorted(String routeParam);

  Future<List<ProductModel>> searchProducts(String searchKey);

  Future<List<BrandModel>> getAllBrands();
}

class ProductRepository implements IProductRepo {
  final IProductDataSrc _iProductDataSrc;

  ProductRepository(this._iProductDataSrc);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<ProductModel>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<ProductModel>> getSorted(String routeParam) =>
      _iProductDataSrc.getSorted(routeParam);

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);

  @override
  Future<List<BrandModel>> getAllBrands() => _iProductDataSrc.getAllBrands();

  @override
  Future<ProductDetailsModel> getProductDetails(int id) =>
      _iProductDataSrc.getProductDetails(id);
}

final productRepository = ProductRepository(ProductRemoteDataSrc(Dio()));
