// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_action_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartActionResponseDto _$CartActionResponseDtoFromJson(
  Map<String, dynamic> json,
) => CartActionResponseDto(
  message: json['message'] as String?,
  guestId: json['guest_id'] as String?,
);

Map<String, dynamic> _$CartActionResponseDtoToJson(
  CartActionResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'guest_id': instance.guestId,
};
