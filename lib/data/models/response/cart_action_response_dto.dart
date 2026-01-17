import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_action_response_dto.g.dart';

@JsonSerializable()
class CartActionResponseDto extends Equatable {
  final String? message;

  @JsonKey(name: 'guest_id')
  final String? guestId;

  const CartActionResponseDto({this.message, this.guestId});

  factory CartActionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartActionResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartActionResponseDtoToJson(this);

  @override
  List<Object?> get props => [message, guestId];
}
