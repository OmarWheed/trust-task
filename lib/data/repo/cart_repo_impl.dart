import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/cart_local_data_source.dart';
import 'package:trust_task/data/data_source/cart_remote_data_source.dart';
import 'package:trust_task/data/mapper/cart_mapper.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/domain/repo/cart_repo.dart';

@LazySingleton(as: CartRepo)
class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource _remoteDataSource;
  final CartLocalDataSource _localDataSource;

  const CartRepoImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Result<CartDetailsEntity>> getCartDetails([String? guestId]) async {
    final effectiveGuestId = guestId ?? _localDataSource.getGuestId();
    if (effectiveGuestId == null) {
      return Failure('Guest ID not found');
    }

    final result = await _remoteDataSource.getCartDetails(effectiveGuestId);
    switch (result) {
      case Success(:final data):
        return Success(data.toEntity());
      case Failure(:final errorMessage):
        return Failure(errorMessage);
    }
  }

  @override
  Future<Result<CartActionEntity>> addCart(AddCartRequestEntity request) async {
    final effectiveGuestId = request.guestId ?? _localDataSource.getGuestId();
    final updatedRequest = AddCartRequestEntity(
      guestId: effectiveGuestId,
      items: request.items,
    );

    final result = await _remoteDataSource.addCart(updatedRequest.toDto());
    switch (result) {
      case Success(:final data):
        return Success(data.toEntity());
      case Failure(:final errorMessage):
        return Failure(errorMessage);
    }
  }

  @override
  Future<Result<CartActionEntity>> deleteCart(
    DeleteCartRequestEntity request,
  ) async {
    final effectiveGuestId = request.guestId ?? _localDataSource.getGuestId();
    final updatedRequest = DeleteCartRequestEntity(
      guestId: effectiveGuestId,
      productId: request.productId,
      quantity: request.quantity,
    );

    final result = await _remoteDataSource.deleteCart(updatedRequest.toDto());
    switch (result) {
      case Success(:final data):
        return Success(data.toEntity());
      case Failure(:final errorMessage):
        return Failure(errorMessage);
    }
  }
}
