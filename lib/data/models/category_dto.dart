import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trust_task/data/models/product_dto.dart';

part 'category_dto.g.dart';

@JsonSerializable()
class CategoryDto extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  
  @JsonKey(name: 'name_en')
  final String? nameEn;
  
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  
  @JsonKey(name: 'image')
  final String? image;
  
  @JsonKey(name: 'products')
  final List<ProductDto>? products;

  const CategoryDto({
    this.id,
    this.nameEn,
    this.nameAr,
    this.image,
    this.products,
  });

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDtoToJson(this);

  @override
  List<Object?> get props => [id, nameEn, nameAr, image, products];
}