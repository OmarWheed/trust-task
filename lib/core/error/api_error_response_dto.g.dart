// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponseDto _$ApiErrorResponseDtoFromJson(Map<String, dynamic> json) =>
    ApiErrorResponseDto(
      code: json['code'] as String,
      message: json['message'] as String,
      data: ErrorData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiErrorResponseDtoToJson(
  ApiErrorResponseDto instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'data': instance.data,
};

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) =>
    ErrorData(status: (json['status'] as num).toInt());

Map<String, dynamic> _$ErrorDataToJson(ErrorData instance) => <String, dynamic>{
  'status': instance.status,
};
