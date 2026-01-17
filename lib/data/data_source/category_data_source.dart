import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/models/category_dto.dart';

abstract interface class CategoryDataSource {
  Future<Result<List<CategoryDto>>> getCategories();
}
