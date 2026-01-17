// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  nameEn: json['name_en'] as String?,
  nameAr: json['name_ar'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  descriptionEn: json['description_en'] as String?,
  descriptionAr: json['description_ar'] as String?,
  price: json['price'] as String?,
  regularPrice: json['regular_price'] as String?,
  salePrice: json['sale_price'] as String?,
  priceTax: (json['price_tax'] as num?)?.toInt(),
  priceTaxSale: (json['price_tax_sale'] as num?)?.toInt(),
  points: (json['points'] as num?)?.toInt(),
  onSale: json['on_sale'] as bool?,
  image: json['image'] as String?,
  totalSales: (json['total_sales'] as num?)?.toInt(),
  stockStatus: json['stock_status'] as String?,
  type: json['type'] as String?,
  status: json['status'] as String?,
  relatedIds: (json['related_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  relatedProducts: (json['related_products'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  categoryIds: (json['category_ids'] as List<dynamic>?)
      ?.map((e) => (e as num).toInt())
      .toList(),
  dateCreated: json['date_created'] as Map<String, dynamic>?,
  dateModified: json['date_modified'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'slug': instance.slug,
      'description': instance.description,
      'description_en': instance.descriptionEn,
      'description_ar': instance.descriptionAr,
      'price': instance.price,
      'regular_price': instance.regularPrice,
      'sale_price': instance.salePrice,
      'price_tax': instance.priceTax,
      'price_tax_sale': instance.priceTaxSale,
      'points': instance.points,
      'on_sale': instance.onSale,
      'image': instance.image,
      'total_sales': instance.totalSales,
      'stock_status': instance.stockStatus,
      'type': instance.type,
      'status': instance.status,
      'related_ids': instance.relatedIds,
      'related_products': instance.relatedProducts,
      'category_ids': instance.categoryIds,
      'date_created': instance.dateCreated,
      'date_modified': instance.dateModified,
    };
