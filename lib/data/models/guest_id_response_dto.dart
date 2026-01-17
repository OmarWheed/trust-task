import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'guest_id_response_dto.g.dart';

@JsonSerializable()
class GuestIdResponseDto extends Equatable {
  @JsonKey(name: 'guest_id')
  final String guestId;

  const GuestIdResponseDto({required this.guestId});

  factory GuestIdResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GuestIdResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GuestIdResponseDtoToJson(this);

  @override
  List<Object?> get props => [guestId];
}
