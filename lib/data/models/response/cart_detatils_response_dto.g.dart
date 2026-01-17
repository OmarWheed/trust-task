// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_detatils_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartDetailsResponseDto _$CartDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => CartDetailsResponseDto(
  cartItems: (json['cart_items'] as List<dynamic>?)
      ?.map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: json['total_price'] as String?,
  vat: json['VAT'] as String?,
  totalPriceWithTax: json['total_price_with_tax'] as String?,
  totalItems: (json['total_items'] as num?)?.toInt(),
  totalPoints: json['total_points'] as String?,
);

Map<String, dynamic> _$CartDetailsResponseDtoToJson(
  CartDetailsResponseDto instance,
) => <String, dynamic>{
  'cart_items': instance.cartItems,
  'total_price': instance.totalPrice,
  'VAT': instance.vat,
  'total_price_with_tax': instance.totalPriceWithTax,
  'total_items': instance.totalItems,
  'total_points': instance.totalPoints,
};

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) => CartItemDto(
  productId: (json['product_id'] as num?)?.toInt(),
  productName: json['product_name'] as String?,
  productNameEn: json['product_name_en'] as String?,
  productNameAr: json['product_name_ar'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as String?,
  addonPrice: json['addon_price'] as num?,
  image: json['image'] as String?,
  addons: json['addons'] as List<dynamic>?,
  points: json['points'] as String?,
  total: json['total'] as String?,
);

Map<String, dynamic> _$CartItemDtoToJson(CartItemDto instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_name_en': instance.productNameEn,
      'product_name_ar': instance.productNameAr,
      'quantity': instance.quantity,
      'price': instance.price,
      'addon_price': instance.addonPrice,
      'image': instance.image,
      'addons': instance.addons,
      'points': instance.points,
      'total': instance.total,
    };
