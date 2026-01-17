import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String? name;
  final String? nameEn;
  final String? nameAr;
  final String? slug;
  final String? description;
  final String? descriptionEn;
  final String? descriptionAr;
  final double? price;
  final double? regularPrice;
  final double? salePrice;
  final int? priceTax;
  final int? priceTaxSale;
  final int? points;
  final bool onSale;
  final String? image;
  final int totalSales;
  final String stockStatus;
  final String type;
  final String status;
  final List<int> relatedIds;
  final List<int> relatedProducts;
  final List<int> categoryIds;
  final DateTime? dateCreated;
  final DateTime? dateModified;

  const ProductEntity({
    required this.id,
    this.name,
    this.nameEn,
    this.nameAr,
    this.slug,
    this.description,
    this.descriptionEn,
    this.descriptionAr,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.priceTax,
    this.priceTaxSale,
    this.points,
    this.onSale = false,
    this.image,
    this.totalSales = 0,
    this.stockStatus = 'instock',
    this.type = 'simple',
    this.status = 'publish',
    this.relatedIds = const [],
    this.relatedProducts = const [],
    this.categoryIds = const [],
    this.dateCreated,
    this.dateModified,
  });

  /// Get product name based on locale
  /// Returns nameEn for English, nameAr for Arabic, falls back to name
  String getLocalizedName(String locale) {
    if (locale == 'ar') {
      return nameAr ?? name ?? 'Product';
    }
    return nameEn ?? name ?? 'Product';
  }

  /// Get product description based on locale
  String getLocalizedDescription(String locale) {
    if (locale == 'ar') {
      return descriptionAr ?? description ?? '';
    }
    return descriptionEn ?? description ?? '';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        nameEn,
        nameAr,
        slug,
        description,
        descriptionEn,
        descriptionAr,
        price,
        regularPrice,
        salePrice,
        priceTax,
        priceTaxSale,
        points,
        onSale,
        image,
        totalSales,
        stockStatus,
        type,
        status,
        relatedIds,
        relatedProducts,
        categoryIds,
        dateCreated,
        dateModified,
      ];
}