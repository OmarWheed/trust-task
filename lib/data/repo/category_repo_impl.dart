import 'package:injectable/injectable.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/data/data_source/category_data_source.dart';
import 'package:trust_task/data/mapper/mapper.dart';
import 'package:trust_task/domain/entities/category_entity.dart';
import 'package:trust_task/domain/repo/category_repo.dart';

@LazySingleton(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  final CategoryDataSource _dataSource;

  const CategoryRepoImpl(this._dataSource);

  @override
  Future<Result<List<CategoryEntity>>> getCategories() async {
    final result = await _dataSource.getCategories();
    switch (result) {
      case Success(:final data):
        return Success(data.map((e) => e.toEntity()).toList());
      case Failure(:final errorMessage):
        return Failure(errorMessage);
    }
  }
}
