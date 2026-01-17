import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/domain/repo/cart_repo.dart';

@lazySingleton
class GetCartDetailsUseCase {
  final CartRepo _cartRepo;

  const GetCartDetailsUseCase(this._cartRepo);

  Future<Result<CartDetailsEntity>> call([String? guestId]) =>
      _cartRepo.getCartDetails(guestId);
}
