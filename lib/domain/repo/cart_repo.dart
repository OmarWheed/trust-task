import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';

abstract interface class CartRepo {
  Future<Result<CartDetailsEntity>> getCartDetails([String? guestId]);
  Future<Result<CartActionEntity>> addCart(AddCartRequestEntity request);
  Future<Result<CartActionEntity>> deleteCart(DeleteCartRequestEntity request);
}
