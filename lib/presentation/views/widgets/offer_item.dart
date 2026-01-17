import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_task/domain/entities/category_entity.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, this.category, this.isSelected = false});

  final CategoryEntity? category;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? Colors.deepOrange : Colors.orange[50],
        border: Border.all(
          color: isSelected ? Colors.deepOrange : Colors.orange[200]!,
          width: isSelected ? 2 : 1,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.deepOrange.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(
              category?.image ?? "https://via.placeholder.com/150",
            ),
            onBackgroundImageError: (exception, stackTrace) {
              // Handle image loading error
            },
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 80,
            child: Text(
              category?.getLocalizedName(context.locale.languageCode) ?? "Category",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
