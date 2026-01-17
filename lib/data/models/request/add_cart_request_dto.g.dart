// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartRequestDto _$AddCartRequestDtoFromJson(Map<String, dynamic> json) =>
    AddCartRequestDto(
      guestId: json['guest_id'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => CartItemRequestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddCartRequestDtoToJson(AddCartRequestDto instance) =>
    <String, dynamic>{'guest_id': instance.guestId, 'items': instance.items};
