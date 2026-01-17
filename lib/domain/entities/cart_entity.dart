import 'package:equatable/equatable.dart';

class CartDetailsEntity extends Equatable {
  final List<CartItemEntity>? cartItems;
  final String? totalPrice;
  final String? vat;
  final String? totalPriceWithTax;
  final int? totalItems;
  final String? totalPoints;

  const CartDetailsEntity({
    this.cartItems,
    this.totalPrice,
    this.vat,
    this.totalPriceWithTax,
    this.totalItems,
    this.totalPoints,
  });

  /// Get cart items with empty list as default
  List<CartItemEntity> get safeCartItems => cartItems ?? [];

  /// Check if cart is empty
  bool get isEmpty => (cartItems?.isEmpty ?? true);

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

class CartItemEntity extends Equatable {
  final int? productId;
  final String? productName;
  final String? productNameEn;
  final String? productNameAr;
  final int? quantity;
  final String? price;
  final num? addonPrice;
  final String? image;
  final List<dynamic>? addons;
  final String? points;
  final String? total;

  const CartItemEntity({
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

class CartActionEntity extends Equatable {
  final String? message;
  final String? guestId;

  const CartActionEntity({this.message, this.guestId});

  @override
  List<Object?> get props => [message, guestId];
}

class AddCartRequestEntity extends Equatable {
  final String? guestId;
  final List<CartItemRequestEntity>? items;

  const AddCartRequestEntity({
    this.guestId,
    this.items,
  });

  @override
  List<Object?> get props => [guestId, items];
}

class CartItemRequestEntity extends Equatable {
  final int productId;
  final int quantity;

  const CartItemRequestEntity({required this.productId, required this.quantity});

  @override
  List<Object?> get props => [productId, quantity];
}

class DeleteCartRequestEntity extends Equatable {
  final String? guestId;
  final int? productId;
  final int? quantity;

  const DeleteCartRequestEntity({this.guestId, this.productId, this.quantity});

  @override
  List<Object?> get props => [guestId, productId, quantity];
}

class GuestIdEntity extends Equatable {
  final String guestId;

  const GuestIdEntity({required this.guestId});

  @override
  List<Object?> get props => [guestId];
}