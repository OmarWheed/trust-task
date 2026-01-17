import 'package:trust_task/data/models/request/add_cart_request_dto.dart';
import 'package:trust_task/data/models/request/cart_item_request_dto.dart';
import 'package:trust_task/data/models/request/delete_cart_request_dto.dart';
import 'package:trust_task/data/models/response/cart_action_response_dto.dart';
import 'package:trust_task/data/models/response/cart_detatils_response_dto.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';

// ================================
// CartDetailsResponse Mapper
// ================================

extension CartDetailsResponseDtoMapper on CartDetailsResponseDto {
  CartDetailsEntity toEntity() {
    return CartDetailsEntity(
      cartItems: cartItems != null && cartItems!.isNotEmpty 
          ? cartItems!.map((item) => item.toEntity()).toList()
          : [], // Return empty list instead of null for empty carts
      totalPrice: totalPrice ?? '0.00',
      vat: vat ?? '0.00',
      totalPriceWithTax: totalPriceWithTax ?? '0.00',
      totalItems: totalItems ?? 0,
      totalPoints: totalPoints ?? '0',
    );
  }
}

extension CartDetailsEntityMapper on CartDetailsEntity {
  CartDetailsResponseDto toDto() {
    return CartDetailsResponseDto(
      cartItems: cartItems?.map((item) => item.toDto()).toList(),
      totalPrice: totalPrice,
      vat: vat,
      totalPriceWithTax: totalPriceWithTax,
      totalItems: totalItems,
      totalPoints: totalPoints,
    );
  }
}

// ================================
// CartItem Mapper
// ================================

extension CartItemDtoMapper on CartItemDto {
  CartItemEntity toEntity() {
    return CartItemEntity(
      productId: productId,
      productName: productName,
      productNameEn: productNameEn,
      productNameAr: productNameAr,
      quantity: quantity,
      price: price,
      addonPrice: addonPrice,
      image: image,
      addons: addons,
      points: points,
      total: total,
    );
  }
}

extension CartItemEntityMapper on CartItemEntity {
  CartItemDto toDto() {
    return CartItemDto(
      productId: productId,
      productName: productName,
      productNameEn: productNameEn,
      productNameAr: productNameAr,
      quantity: quantity,
      price: price,
      addonPrice: addonPrice,
      image: image,
      addons: addons,
      points: points,
      total: total,
    );
  }
}

// ================================
// CartActionResponse Mapper
// ================================

extension CartActionResponseDtoMapper on CartActionResponseDto {
  CartActionEntity toEntity() {
    return CartActionEntity(
      message: message,
      guestId: guestId,
    );
  }
}

extension CartActionEntityMapper on CartActionEntity {
  CartActionResponseDto toDto() {
    return CartActionResponseDto(
      message: message,
      guestId: guestId,
    );
  }
}

// ================================
// AddCartRequest Mapper
// ================================

extension AddCartRequestDtoMapper on AddCartRequestDto {
  AddCartRequestEntity toEntity() {
    return AddCartRequestEntity(
      guestId: guestId,
      items: items?.map((item) => item.toEntity()).toList(),
    );
  }
}

extension AddCartRequestEntityMapper on AddCartRequestEntity {
  AddCartRequestDto toDto() {
    return AddCartRequestDto(
      guestId: guestId,
      items: items?.map((item) => item.toDto()).toList(),
    );
  }
}

extension CartItemRequestDtoMapper on CartItemRequestDto {
  CartItemRequestEntity toEntity() {
    return CartItemRequestEntity(
      productId: productId,
      quantity: quantity,
    );
  }
}

extension CartItemRequestEntityMapper on CartItemRequestEntity {
  CartItemRequestDto toDto() {
    return CartItemRequestDto(
      productId: productId,
      quantity: quantity,
    );
  }
}

// ================================
// DeleteCartRequest Mapper
// ================================

extension DeleteCartRequestDtoMapper on DeleteCartRequestDto {
  DeleteCartRequestEntity toEntity() {
    return DeleteCartRequestEntity(
      guestId: guestId,
      productId: productId,
      quantity: quantity,
    );
  }
}

extension DeleteCartRequestEntityMapper on DeleteCartRequestEntity {
  DeleteCartRequestDto toDto() {
    return DeleteCartRequestDto(
      guestId: guestId,
      productId: productId,
      quantity: quantity,
    );
  }
}

// ================================
// GuestId Mapper
// ================================

// Note: Since you don't have a GuestIdDto, you can create one or use CartActionResponseDto
// If you need a specific GuestIdDto, add this:

// @JsonSerializable()
// class GuestIdDto extends Equatable {
//   @JsonKey(name: 'guest_id')
//   final String? guestId;
//
//   const GuestIdDto({this.guestId});
//
//   factory GuestIdDto.fromJson(Map<String, dynamic> json) => _$GuestIdDtoFromJson(json);
//   Map<String, dynamic> toJson() => _$GuestIdDtoToJson(this);
//
//   @override
//   List<Object?> get props => [guestId];
// }

// Then add these extensions:
extension CartActionToGuestIdMapper on CartActionResponseDto {
  GuestIdEntity toGuestIdEntity() {
    return GuestIdEntity(guestId: guestId ?? '');
  }
}

extension GuestIdEntityToCartActionMapper on GuestIdEntity {
  CartActionResponseDto toCartActionDto() {
    return CartActionResponseDto(guestId: guestId);
  }
}