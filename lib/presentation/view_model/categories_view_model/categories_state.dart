import 'package:equatable/equatable.dart';
import 'package:trust_task/core/bloc_box/base_state.dart';
import 'package:trust_task/domain/entities/category_entity.dart';

class CategoriesState extends Equatable {
  final BaseState<List<CategoryEntity>>? categoriesState;
  final BaseState<int>? selectedIndex;

  const CategoriesState({this.categoriesState, this.selectedIndex});

  CategoriesState copyWith({
    BaseState<List<CategoryEntity>>? categoriesState,
    BaseState<int>? selectedIndex,
  }) {
    return CategoriesState(
      categoriesState: categoriesState ?? this.categoriesState,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  List<Object?> get props => [categoriesState, selectedIndex];
}
