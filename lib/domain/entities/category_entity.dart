import 'package:equatable/equatable.dart';
import 'product_entity.dart';

class CategoryEntity extends Equatable {
  final int id;
  final String? nameEn;
  final String? nameAr;
  final String? image;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.products = const [],
  });

  /// Get category name based on locale
  String getLocalizedName(String locale) {
    if (locale == 'ar') {
      return nameAr ?? nameEn ?? 'Category';
    }
    return nameEn ?? nameAr ?? 'Category';
  }

  @override
  List<Object?> get props => [id, nameEn, nameAr, image, products];
}