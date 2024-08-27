import 'package:dio/dio.dart';
import 'package:watch_store/data/config/api_constant.dart';
import 'package:watch_store/data/model/brand_model.dart';
import 'package:watch_store/data/model/product_details_model.dart';
import 'package:watch_store/data/model/product_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSrc {
  Future<ProductDetailsModel> getProductDetails(int id);

  Future<List<ProductModel>> getAllByCategory(int id);

  Future<List<ProductModel>> getAllByBrand(int id);

  Future<List<ProductModel>> getSorted(String routeParam);

  Future<List<ProductModel>> searchProducts(String searchKey);

  Future<List<BrandModel>> getAllBrands();
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.productsByBrand + id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['products_by_brands']['data'] as List)) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.productsByCategory + id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in response.data['products_by_category']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getSorted(String routeParam) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.baseUrl + routeParam.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> searchProducts(String searchKey) async {
    List<ProductModel> products = <ProductModel>[];

    final response =
        await httpClient.get(ApiConstant.search + searchKey.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<BrandModel>> getAllBrands() async {
    List<BrandModel> brands = <BrandModel>[];

    final response = await httpClient.get(ApiConstant.brands);
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in response.data['all_brands'] as List) {
      brands.add(BrandModel.fromJson(element));
    }
    return brands;
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async {
    final response =
        await httpClient.get(ApiConstant.productDetails + id.toString());
    HttpResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return ProductDetailsModel.fromJson(response.data['data'][0]);
  }
}
