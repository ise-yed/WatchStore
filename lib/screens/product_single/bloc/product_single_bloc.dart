import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/product_details_model.dart';

import '../../../data/repo/product_repo.dart';

part 'product_single_event.dart';

part 'product_single_state.dart';

class ProductSingleBloc extends Bloc<ProductSingleEvent, ProductSingleState> {
  final IProductRepo _iProductRepo;

  ProductSingleBloc(this._iProductRepo) : super(ProductSingleLoading()) {
    on<ProductSingleEvent>((event, emit) async {
      if (event is ProductSingleInit) {
        try {
          emit(ProductSingleLoading());
          final productDetails =
              await _iProductRepo.getProductDetails(event.id);
          emit(ProductSingleSuccess(productDetails));
        } catch (e) {
          emit(ProductSingleError(e.toString()));
          // emit(ProductSingleError("خطا در پردازش اطلاعات محصول"));
        }
      }
    });
  }
}
