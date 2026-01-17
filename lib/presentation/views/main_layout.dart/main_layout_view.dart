import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trust_task/presentation/views/cart_view.dart';
import 'package:trust_task/presentation/views/categories_view.dart';
import 'package:trust_task/presentation/views/settings_view.dart';

class MainLayoutView extends StatefulWidget {
  static const String routeName = '/main';

  const MainLayoutView({super.key});

  @override
  State<MainLayoutView> createState() => _MainLayoutViewState();
}

class _MainLayoutViewState extends State<MainLayoutView> {
  int index = 0;
  final List<Widget> pages = [
    const CategoriesView(),
    const CartView(),
    const SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    // Get localized labels based on current locale
    final isArabic = context.locale.languageCode == 'ar';
    final categoriesLabel = isArabic ? 'الفئات' : 'Categories';
    final cartLabel = isArabic ? 'السلة' : 'Cart';
    final settingsLabel = isArabic ? 'الإعدادات' : 'Settings';

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: categoriesLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            label: cartLabel,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: settingsLabel,
          ),
        ],
      ),
      body: pages[index],
    );
  }
}