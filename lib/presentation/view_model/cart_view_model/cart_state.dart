import 'package:equatable/equatable.dart';
import 'package:trust_task/core/bloc_box/base_state.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';

class CartState extends Equatable {
  final BaseState<CartDetailsEntity>? cartState;
  const CartState({this.cartState});
  CartState copyWith({
    BaseState<CartDetailsEntity>? cartState,
  }) {
    return CartState(
      cartState: cartState ?? this.cartState,
    );
  }

  @override
  List<Object?> get props => [cartState];
}