import 'package:json_annotation/json_annotation.dart';

part 'api_error_response_dto.g.dart';

@JsonSerializable()
class ApiErrorResponseDto {
  final String code;
  final String message;
  final ErrorData data;

  ApiErrorResponseDto({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ApiErrorResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseDtoToJson(this);
}

@JsonSerializable()
class ErrorData {
  final int status;

  ErrorData({required this.status});

  factory ErrorData.fromJson(Map<String, dynamic> json) =>
      _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}
