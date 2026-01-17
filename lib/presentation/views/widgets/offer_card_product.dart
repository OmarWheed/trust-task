import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_task/domain/entities/product_entity.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_viewmodel.dart';

class OfferCardProduct extends StatefulWidget {
  const OfferCardProduct({super.key, this.product});
  final ProductEntity? product;

  @override
  State<OfferCardProduct> createState() => _OfferCardProductState();
}

class _OfferCardProductState extends State<OfferCardProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.orange[50] ?? Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.grey[200],
                      child: Image.network(
                        widget.product?.image ??
                            "https://via.placeholder.com/150",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey[600],
                          ),
                        ),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.product?.getLocalizedName(context.locale.languageCode) ?? "Product Name",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                        ),
                        const SizedBox(height: 6),
                        // if (widget.product?.shortDescription != null &&
                        //     widget.product!.shortDescription!.isNotEmpty)
                        //   Text(
                        //     widget.product!.shortDescription!,
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: Theme.of(context).textTheme.bodySmall
                        //         ?.copyWith(color: Colors.grey[600]),
                        //   ),
                        const SizedBox(height: 6),
                        SizedBox(
                          height: 24,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  '\$${widget.product?.price ?? "0.00"}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrange,
                                        fontSize: 16,
                                      ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (widget.product?.salePrice != null)
                                Flexible(
                                  child: Text(
                                    '\$${widget.product!.salePrice}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.bodySmall
                                        ?.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Colors.grey[500],
                                        ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 80,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // Add to cart
                              context.read<CartViewModel>().addItemToCart(widget.product!);
                              
                              final productName = widget.product?.getLocalizedName(context.locale.languageCode) ?? "Product";
                              final message = context.locale.languageCode == 'ar'
                                  ? 'تم إضافة $productName إلى السلة'
                                  : '$productName added to cart';

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor: Colors.deepOrange,
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
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
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'In Stock',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 9,
                              color: Colors.green[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
