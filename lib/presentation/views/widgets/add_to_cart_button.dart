import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_task/domain/entities/product_entity.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_viewmodel.dart';

class AddToCartButton extends StatelessWidget {
  final ProductEntity? product;

  const AddToCartButton({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final productName = product?.getLocalizedName(context.locale.languageCode) ?? "Product";
    final addedMessage = context.locale.languageCode == 'ar' 
        ? 'تم إضافة $productName إلى السلة'
        : 'Added $productName to cart';

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          if (product != null) {
            // Add to cart
            context.read<CartViewModel>().addItemToCart(product!);

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(addedMessage),
                duration: const Duration(seconds: 2),
                backgroundColor: const Color(0xFFEA5455),
              ),
            );
          }
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEA5455),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.add_shopping_cart,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
