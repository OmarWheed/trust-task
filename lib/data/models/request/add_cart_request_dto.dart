import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trust_task/data/models/request/cart_item_request_dto.dart';

part 'add_cart_request_dto.g.dart';

@JsonSerializable()
class AddCartRequestDto extends Equatable {
  @JsonKey(name: 'guest_id')
  final String? guestId;
  final List<CartItemRequestDto>? items;

  const AddCartRequestDto({
    this.guestId,
    this.items,
  });

  factory AddCartRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AddCartRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartRequestDtoToJson(this);

  @override
  List<Object?> get props => [guestId, items];
}