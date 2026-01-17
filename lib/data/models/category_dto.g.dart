// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
  id: (json['id'] as num?)?.toInt(),
  nameEn: json['name_en'] as String?,
  nameAr: json['name_ar'] as String?,
  image: json['image'] as String?,
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name_en': instance.nameEn,
      'name_ar': instance.nameAr,
      'image': instance.image,
      'products': instance.products,
    };
