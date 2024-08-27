import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/model/cart_model.dart';

import '../../../data/repo/cart_repo.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepo _iCartRepo;

  CartBloc(this._iCartRepo) : super(CartLoadingState()) {
    on<CartEvent>((event, emit) async {
      try {
        if (event is CartInitEvent) {
          emit(CartLoadingState());
          final cartModel = await _iCartRepo.getUserCart();
          emit(CartSuccessState(cartModel));
        } else if (event is AddToCartEvent) {
          await _iCartRepo
              .addToCart(productId: event.productId)
              .then((value) => emit(CartItemAddedState(value)));
        } else if (event is RemoveFromCartEvent) {
          await _iCartRepo
              .removeFromCart(productId: event.productId)
              .then((value) => emit(CartItemRemoveState(value)));
        } else if (event is DeleteFromCartEvent) {
          await _iCartRepo
              .deleteFromCart(productId: event.productId)
              .then((value) => emit(CartItemDeleteState(value)));
        } else if (event is CartCountItemEvent) {
          await _iCartRepo
              .countCartItem()
              .then((value) => emit(CartItemCountState()));
        } else if (event is PaymentEvent) {
          await _iCartRepo
              .paymentCart()
              .then((value) => emit(RecivedPaymentLinkState(value)));
        }
      } catch (e) {
        emit(CartErrorState(e.toString()));
      }
    });
  }
}
