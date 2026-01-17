import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_task/domain/entities/cart_entity.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_viewmodel.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemEntity item;
  final VoidCallback? onQuantityChanged;

  const CartItemWidget({super.key, required this.item, this.onQuantityChanged});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return Directionality(
      textDirection: isArabic ? ui.TextDirection.rtl : ui.TextDirection.ltr,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            /// ➕ Add button
            GestureDetector(
              onTap: onQuantityChanged,
              child: Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: Color(0xFFEA5455),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),

            const SizedBox(width: 8),

            /// Quantity
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '${item.quantity ?? 0}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ),

            const SizedBox(width: 8),

            /// 🗑 Delete button
            GestureDetector(
              onTap: () {
                if (item.productId != null) {
                  context.read<CartViewModel>().removeProductFromCart(
                        item.productId ?? 0,
                      );
                }
              },
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEA5455), width: 2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.delete_outline,
                  color: Color(0xFFEA5455),
                  size: 20,
                ),
              ),
            ),

            const SizedBox(width: 12),

            /// Product info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getLocalizedProductName(context),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${item.price ?? '0.0'} ج.م',
                    style: const TextStyle(
                      color: Color(0xFFEA5455),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (item.total != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      'الإجمالي: ${item.total} ج.م',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ],
              ),
            ),

            /// Product image
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                item.image ?? 'https://i.imgur.com/0umadnY.png',
                width: 70,
                height: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedProductName(BuildContext context) {
    final isArabic = context.locale.languageCode == 'ar';
    return isArabic 
        ? (item.productNameAr ?? item.productName ?? 'منتج')
        : (item.productName ?? item.productNameAr ?? 'Product');
  }
}