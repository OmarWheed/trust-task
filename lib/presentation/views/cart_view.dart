import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_state.dart';
import 'package:trust_task/presentation/view_model/cart_view_model/cart_viewmodel.dart';
import 'package:trust_task/presentation/views/widgets/cart_item_widget.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartViewModel>().getOrders();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartViewModel, CartState>(
      builder: (context, state) {
        final cartState = state.cartState;
        final cartDetails = cartState?.data;
        final cartItems = cartDetails?.safeCartItems ?? [];
        final isEmpty = cartDetails?.isEmpty ?? true;

        if (cartState?.isLoading ?? false) {
          return const Center(child: CircularProgressIndicator());
        }

        if (cartState?.isError ?? false) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  cartState?.errorMessage?.toString() ?? 'cart_error'.tr(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () => context.read<CartViewModel>().getOrders(),
                  icon: const Icon(Icons.refresh),
                  label: Text('cart_retry'.tr()),
                ),
              ],
            ),
          );
        }

        if (isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation/empty_cart.json', width: 200),
                const SizedBox(height: 20),
                Text('cart_empty_title'.tr(),
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('nav_cart'.tr()),
                floating: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.delete_sweep),
                    onPressed: () {
                      // Implement clear cart functionality
                    },
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = cartItems[index];
                    return CartItemWidget(item: item);
                  },
                  childCount: cartItems.length,
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('cart_total'.tr(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${cartDetails?.totalPrice ?? '0.00'} EGP',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child:
                        Text('cart_checkout'.tr(), style: const TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}