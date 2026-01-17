import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/domain/repo/cart_repo.dart';

@lazySingleton
class DeleteCartUseCase {
  final CartRepo _cartRepo;

  const DeleteCartUseCase(this._cartRepo);

  Future<Result<CartActionEntity>> call(DeleteCartRequestEntity request) =>
      _cartRepo.deleteCart(request);
}
