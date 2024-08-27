import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/brand_model.dart';
import 'package:watch_store/data/model/product_model.dart';

import '../../../data/repo/product_repo.dart';

part 'product_list_event.dart';

part 'product_list_state.dart';

class ProductListBloc extends Bloc<ProductListEvent, ProductListState> {
  final IProductRepo _iProductRepo;

  ProductListBloc(this._iProductRepo) : super(ProductListLoading()) {
    on<ProductListEvent>((event, emit) async {
      final brandList = await _iProductRepo.getAllBrands();
      if (event is ProductListByCat) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByCategory(event.catId);
          emit(ProductListSuccess(productList, brandList));
        } catch (e) {
          emit(ProductListError('خطا در دریافت اطلاعات!!'));
        }
      }

      if (event is ProductListByBrand) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getAllByBrand(event.brandId);
          emit(ProductListSuccess(productList, brandList));
        } catch (e) {
          emit(ProductListError('خطا در دریافت اطلاعات!!'));
        }
      }

      if (event is ProductListBySearch) {
        try {
          emit(ProductListLoading());
          final productList =
              await _iProductRepo.searchProducts(event.searchKey);
          if (productList.isEmpty) {
            emit(ProductListError('هیچ محصولی یافت نشد'));
          } else {
            emit(ProductListSuccess(productList, brandList));
          }
        } catch (e) {
          emit(ProductListError('خطا در دریافت اطلاعات!!'));
        }
      }

      if (event is ProductListSorted) {
        try {
          emit(ProductListLoading());
          final productList = await _iProductRepo.getSorted(event.sortParam);
          emit(ProductListSuccess(productList, brandList));
        } catch (e) {
          emit(ProductListError('خطا در دریافت اطلاعات!!'));
        }
      }
    });
  }
}
