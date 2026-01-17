import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:trust_task/core/bloc_box/base_state.dart';
import 'package:trust_task/core/error/result.dart';
import 'package:trust_task/domain/repo/category_repo.dart';
import 'package:trust_task/presentation/view_model/categories_view_model/categories_state.dart';

@lazySingleton
class CategoiresViewModel extends Cubit<CategoriesState> {
  final CategoryRepo _categoryRepo;
  CategoiresViewModel(this._categoryRepo)
    : super(
        CategoriesState(
          categoriesState: BaseState.init(),
          selectedIndex: BaseState.init(0),
        ),
      );

  updateIndex(int newIndex) {
    emit(state.copyWith(selectedIndex: BaseState.loaded(newIndex)));
  }

  Future<void> fetchCategories() async {
    emit(state.copyWith(categoriesState: BaseState.loading()));
    final result = await _categoryRepo.getCategories();
    switch (result) {
      case Success(:final data):
        emit(state.copyWith(categoriesState: BaseState.loaded(data)));
      case Failure(:final errorMessage):
        emit(state.copyWith(categoriesState: BaseState.error(errorMessage)));
    }
  }
}
