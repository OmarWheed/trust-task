import 'package:injectable/injectable.dart';
import 'package:trust_task/core/api/api_client.dart';

import 'package:trust_task/core/error/execute_api.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/cart_remote_data_source.dart';
import 'package:trust_task/data/models/request/add_cart_request_dto.dart';
import 'package:trust_task/data/models/request/delete_cart_request_dto.dart';
import 'package:trust_task/data/models/response/cart_action_response_dto.dart';
import 'package:trust_task/data/models/response/cart_detatils_response_dto.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiClient _apiService;

  const CartRemoteDataSourceImpl(this._apiService);

  @override
  Future<Result<CartDetailsResponseDto>> getCartDetails(String guestId) {
    return executeApi(() => _apiService.getCartDetails(guestId));
  }

  @override
  Future<Result<CartActionResponseDto>> addCart(AddCartRequestDto request) {
    return executeApi(() => _apiService.addCart(request));
  }

  @override
  Future<Result<CartActionResponseDto>> deleteCart(
    DeleteCartRequestDto request,
  ) {
    return executeApi(() => _apiService.deleteCart(request));
  }
}
