import 'package:injectable/injectable.dart';
import 'package:trust_task/core/api/api_client.dart';
import 'package:trust_task/core/error/execute_api.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/category_data_source.dart';
import 'package:trust_task/data/models/category_dto.dart';

@LazySingleton(as: CategoryDataSource)
class CategoryDataSourceImpl implements CategoryDataSource {
  final ApiClient _apiService;

  const CategoryDataSourceImpl(this._apiService);

  @override
  Future<Result<List<CategoryDto>>> getCategories() {
    return executeApi(() => _apiService.getCategories());
  }
}
