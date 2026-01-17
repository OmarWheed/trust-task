import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_cart_request_dto.g.dart';

@JsonSerializable()
class DeleteCartRequestDto extends Equatable {
  @JsonKey(name: 'guest_id')
  final String? guestId;

  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'quantity')
  final int? quantity;

  const DeleteCartRequestDto({this.guestId, this.productId, this.quantity});

  factory DeleteCartRequestDto.fromJson(Map<String, dynamic> json) =>
      _$DeleteCartRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteCartRequestDtoToJson(this);

  @override
  List<Object?> get props => [guestId, productId, quantity];
}
