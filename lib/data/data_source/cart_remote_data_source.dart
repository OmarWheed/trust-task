import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/models/request/add_cart_request_dto.dart';
import 'package:trust_task/data/models/request/delete_cart_request_dto.dart';
import 'package:trust_task/data/models/response/cart_action_response_dto.dart';
import 'package:trust_task/data/models/response/cart_detatils_response_dto.dart';

abstract interface class CartRemoteDataSource {
  Future<Result<CartDetailsResponseDto>> getCartDetails(String guestId);
  Future<Result<CartActionResponseDto>> addCart(AddCartRequestDto request);
  Future<Result<CartActionResponseDto>> deleteCart(
    DeleteCartRequestDto request,
  );
}
