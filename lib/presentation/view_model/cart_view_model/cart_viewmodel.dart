import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_task/core/bloc_box/base_state.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/domain/entities/product_entity.dart';
import 'package:trust_task/domain/repo/cart_repo.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_state.dart';

@lazySingleton
class CartViewModel extends Cubit<CartState> {
  final CartRepo _cartRepo;
  CartViewModel(this._cartRepo)
      : super( CartState(cartState: BaseState.init()));

  Future<void> addItemToCart(ProductEntity product) async {
    final cartItem = CartItemRequestEntity(
      productId: product.id,
      quantity: 1,
    );

    final request = AddCartRequestEntity(items: [cartItem]);

    final response = await _cartRepo.addCart(request);

    switch (response) {
      case Success<CartActionEntity>():
        await getOrders();
        break;

      case Failure<CartActionEntity>():
        emit(state.copyWith(
            cartState: BaseState.error(response.errorMessage)));
    }
  }

  Future<void> removeProductFromCart(int productId) async {
    final response = await _cartRepo.deleteCart(
      DeleteCartRequestEntity(productId: productId),
    );

    switch (response) {
      case Success<CartActionEntity>():
        await getOrders();
        break;

      case Failure<CartActionEntity>():
        emit(state.copyWith(
            cartState: BaseState.error(response.errorMessage)));
    }
  }

  Future<void> getOrders() async {
    emit(state.copyWith(cartState:  BaseState.loading()));
    final response = await _cartRepo.getCartDetails();

    switch (response) {
      case Success<CartDetailsEntity>():
        emit(state.copyWith(cartState: BaseState.loaded(response.data)));
        break;
      case Failure<CartDetailsEntity>():
        emit(state.copyWith(cartState: BaseState.error(response.errorMessage)));
        break;
    }
  }
}