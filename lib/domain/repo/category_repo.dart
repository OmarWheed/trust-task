import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/entities/category_entity.dart';

abstract interface class CategoryRepo {
  Future<Result<List<CategoryEntity>>> getCategories();
}
