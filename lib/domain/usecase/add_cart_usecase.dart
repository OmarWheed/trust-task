import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/domain/repo/cart_repo.dart';

@lazySingleton
class AddCartUseCase {
  final CartRepo _cartRepo;

  const AddCartUseCase(this._cartRepo);

  Future<Result<CartActionEntity>> call(AddCartRequestEntity request) =>
      _cartRepo.addCart(request);
}
