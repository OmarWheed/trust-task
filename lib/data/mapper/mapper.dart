import 'package:trust_task/data/models/category_dto.dart';
import 'package:trust_task/data/models/product_dto.dart';
import 'package:trust_task/domain/entities/category_entity.dart';
import 'package:trust_task/domain/entities/product_entity.dart';

extension ProductDtoMapper on ProductDto {
  ProductEntity toEntity() {
    return ProductEntity(
      id: id ?? 0,
      name: name,
      nameEn: nameEn,
      nameAr: nameAr,
      slug: slug,
      description: description,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      price: _parseDouble(price),
      regularPrice: _parseDouble(regularPrice),
      salePrice: _parseDouble(salePrice),
      priceTax: priceTax,
      priceTaxSale: priceTaxSale,
      points: points,
      onSale: onSale ?? false,
      image: image,
      totalSales: totalSales ?? 0,
      stockStatus: stockStatus ?? 'instock',
      type: type ?? 'simple',
      status: status ?? 'publish',
      relatedIds: relatedIds ?? [],
      relatedProducts: relatedProducts ?? [],
      categoryIds: categoryIds ?? [],
      dateCreated: _parseDateTime(dateCreated?['date']),
      dateModified: _parseDateTime(dateModified?['date']),
    );
  }

  double? _parseDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    try {
      return double.tryParse(value);
    } catch (_) {
      return null;
    }
  }

  DateTime? _parseDateTime(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      // Try parsing the specific format from JSON
      final parts = dateString.split('.');
      if (parts.length > 1) {
        final mainDate = parts[0];
        return DateTime.parse(mainDate);
      }
      return DateTime.parse(dateString);
    } catch (_) {
      return null;
    }
  }
}

extension ProductEntityMapper on ProductEntity {
  ProductDto toDto() {
    return ProductDto(
      id: id,
      name: name,
      nameEn: nameEn,
      nameAr: nameAr,
      slug: slug,
      description: description,
      descriptionEn: descriptionEn,
      descriptionAr: descriptionAr,
      price: price?.toString(),
      regularPrice: regularPrice?.toString(),
      salePrice: salePrice?.toString(),
      priceTax: priceTax,
      priceTaxSale: priceTaxSale,
      points: points,
      onSale: onSale,
      image: image,
      totalSales: totalSales,
      stockStatus: stockStatus,
      type: type,
      status: status,
      relatedIds: relatedIds,
      relatedProducts: relatedProducts,
      categoryIds: categoryIds,
      dateCreated: dateCreated != null
          ? {
              'date': dateCreated!.toIso8601String(),
              'timezone_type': 3,
              'timezone': 'Africa/Cairo',
            }
          : null,
      dateModified: dateModified != null
          ? {
              'date': dateModified!.toIso8601String(),
              'timezone_type': 3,
              'timezone': 'Africa/Cairo',
            }
          : null,
    );
  }
}




extension CategoryDtoMapper on CategoryDto {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: id ?? 0,
      nameEn: nameEn,
      nameAr: nameAr,
      image: image,
      products: products?.map((product) => product.toEntity()).toList() ?? [],
    );
  }
}

extension CategoryEntityMapper on CategoryEntity {
  CategoryDto toDto() {
    return CategoryDto(
      id: id,
      nameEn: nameEn,
      nameAr: nameAr,
      image: image,
      products: products.map((product) => product.toDto()).toList(),
    );
  }
}