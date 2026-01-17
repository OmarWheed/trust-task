// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_cart_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCartRequestDto _$DeleteCartRequestDtoFromJson(
  Map<String, dynamic> json,
) => DeleteCartRequestDto(
  guestId: json['guest_id'] as String?,
  productId: (json['product_id'] as num?)?.toInt(),
  quantity: (json['quantity'] as num?)?.toInt(),
);

Map<String, dynamic> _$DeleteCartRequestDtoToJson(
  DeleteCartRequestDto instance,
) => <String, dynamic>{
  'guest_id': instance.guestId,
  'product_id': instance.productId,
  'quantity': instance.quantity,
};
