// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemRequestDto _$CartItemRequestDtoFromJson(Map<String, dynamic> json) =>
    CartItemRequestDto(
      productId: (json['product_id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemRequestDtoToJson(CartItemRequestDto instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
    };
