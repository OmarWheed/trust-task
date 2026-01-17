import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_dto.g.dart';

@JsonSerializable()
class ProductDto extends Equatable {
  @JsonKey(name: 'id')
  final int? id;
  
  @JsonKey(name: 'name')
  final String? name;
  
  @JsonKey(name: 'name_en')
  final String? nameEn;
  
  @JsonKey(name: 'name_ar')
  final String? nameAr;
  
  @JsonKey(name: 'slug')
  final String? slug;
  
  @JsonKey(name: 'description')
  final String? description;
  
  @JsonKey(name: 'description_en')
  final String? descriptionEn;
  
  @JsonKey(name: 'description_ar')
  final String? descriptionAr;
  
  @JsonKey(name: 'price')
  final String? price;
  
  @JsonKey(name: 'regular_price')
  final String? regularPrice;
  
  @JsonKey(name: 'sale_price')
  final String? salePrice;
  
  @JsonKey(name: 'price_tax')
  final int? priceTax;
  
  @JsonKey(name: 'price_tax_sale')
  final int? priceTaxSale;
  
  @JsonKey(name: 'points')
  final int? points;
  
  @JsonKey(name: 'on_sale')
  final bool? onSale;
  
  @JsonKey(name: 'image')
  final String? image;
  
  @JsonKey(name: 'total_sales')
  final int? totalSales;
  
  @JsonKey(name: 'stock_status')
  final String? stockStatus;
  
  @JsonKey(name: 'type')
  final String? type;
  
  @JsonKey(name: 'status')
  final String? status;
  
  @JsonKey(name: 'related_ids')
  final List<int>? relatedIds;
  
  @JsonKey(name: 'related_products')
  final List<int>? relatedProducts;
  
  @JsonKey(name: 'category_ids')
  final List<int>? categoryIds;
  
  @JsonKey(name: 'date_created')
  final Map<String, dynamic>? dateCreated;
  
  @JsonKey(name: 'date_modified')
  final Map<String, dynamic>? dateModified;

  const ProductDto({
    this.id,
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
    this.onSale,
    this.image,
    this.totalSales,
    this.stockStatus,
    this.type,
    this.status,
    this.relatedIds,
    this.relatedProducts,
    this.categoryIds,
    this.dateCreated,
    this.dateModified,
  });

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDtoToJson(this);

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