import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/category_entity.dart';
import 'package:trust_task/domain/repo/category_repo.dart';

@lazySingleton
class GetCategoriesUseCase {
  final CategoryRepo _categoryRepo;

  const GetCategoriesUseCase(this._categoryRepo);

  Future<Result<List<CategoryEntity>>> call() => _categoryRepo.getCategories();
}
