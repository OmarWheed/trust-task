import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_detatils_response_dto.g.dart';

@JsonSerializable()
class CartDetailsResponseDto extends Equatable {
  @JsonKey(name: 'cart_items')
  final List<CartItemDto>? cartItems;

  @JsonKey(name: 'total_price')
  final String? totalPrice;

  @JsonKey(name: 'VAT')
  final String? vat;

  @JsonKey(name: 'total_price_with_tax')
  final String? totalPriceWithTax;

  @JsonKey(name: 'total_items')
  final int? totalItems;

  @JsonKey(name: 'total_points')
  final String? totalPoints;

  const CartDetailsResponseDto({
    this.cartItems,
    this.totalPrice,
    this.vat,
    this.totalPriceWithTax,
    this.totalItems,
    this.totalPoints,
  });

  factory CartDetailsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CartDetailsResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartDetailsResponseDtoToJson(this);

  /// Get cart items with empty list as default
  List<CartItemDto> get safeCartItems => cartItems ?? [];

  /// Check if cart is empty
  bool get isEmpty => cartItems?.isEmpty ?? true;

  @override
  List<Object?> get props => [
    cartItems,
    totalPrice,
    vat,
    totalPriceWithTax,
    totalItems,
    totalPoints,
  ];
}

@JsonSerializable()
class CartItemDto extends Equatable {
  @JsonKey(name: 'product_id')
  final int? productId;

  @JsonKey(name: 'product_name')
  final String? productName;

  @JsonKey(name: 'product_name_en')
  final String? productNameEn;

  @JsonKey(name: 'product_name_ar')
  final String? productNameAr;

  final int? quantity;

  final String? price;

  @JsonKey(name: 'addon_price')
  final num? addonPrice;

  final String? image;

  final List<dynamic>? addons;

  final String? points;

  final String? total;

  const CartItemDto({
    this.productId,
    this.productName,
    this.productNameEn,
    this.productNameAr,
    this.quantity,
    this.price,
    this.addonPrice,
    this.image,
    this.addons,
    this.points,
    this.total,
  });

  factory CartItemDto.fromJson(Map<String, dynamic> json) =>
      _$CartItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemDtoToJson(this);

  @override
  List<Object?> get props => [
    productId,
    productName,
    productNameEn,
    productNameAr,
    quantity,
    price,
    addonPrice,
    image,
    addons,
    points,
    total,
  ];
}
