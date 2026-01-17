import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item_request_dto.g.dart';

@JsonSerializable()
class CartItemRequestDto extends Equatable {
  @JsonKey(name: 'product_id')
  final int productId;
  final int quantity;

  const CartItemRequestDto({required this.productId, required this.quantity});

  factory CartItemRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemRequestDtoToJson(this);

  @override
  List<Object?> get props => [productId, quantity];
}