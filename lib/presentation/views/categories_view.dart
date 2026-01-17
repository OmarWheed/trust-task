import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_task/presentation/view_model/categories_view_model/categoires_view_model.dart';
import 'package:trust_task/presentation/view_model/categories_view_model/categories_state.dart';
import 'widgets/widgets.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  Widget build(BuildContext context) {
    int index =
        context.watch<CategoiresViewModel>().state.selectedIndex?.data ?? 0;
    return SafeArea(
      child: BlocBuilder<CategoiresViewModel, CategoriesState>(
        builder: (context, state) {
          // Handle null state
          if (state.categoriesState == null) {
            return const Center(
              child: Text(
                'An unexpected error occurred',
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
            );
          }

          if (state.categoriesState!.isLoading ||
              state.categoriesState!.isInitial) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
              ),
            );
          }

          // Handle loaded state
          if (state.categoriesState!.isLoaded) {
            final categories = state.categoriesState!.data;

            // Defensive check: ensure categories is a list
            if (categories == null || categories.isEmpty) {
              return const Center(
                child: Text(
                  'No categories available',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              );
            }

            // Ensure index is within bounds
            final safeIndex = index >= categories.length ? 0 : index;
            final selectedCategory = categories[safeIndex];

            // Get products list (never null due to default value in entity)
            final products = selectedCategory.products;

            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Categories',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrange,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Browse our collection',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.grey[600],
                                    ),
                              ),
                            ],
                          ),
                        ),
                        // Categories Horizontal List
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            scrollDirection: Axis.horizontal,
                            itemCount: categories.length,
                            itemBuilder: (context, catIndex) {
                              final category = categories[catIndex];
                              final isSelected = catIndex == safeIndex;
                              return GestureDetector(
                                onTap: () {
                                  context
                                      .read<CategoiresViewModel>()
                                      .updateIndex(
                                        catIndex,
                                      );
                                },
                                child: OfferItem(
                                  category: category,
                                  isSelected: isSelected,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Products Section Header
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${context.locale.languageCode == 'ar' ? selectedCategory.nameAr : selectedCategory.nameEn} Products',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ];
              },
              body: products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag_outlined,
                            size: 64,
                            color: Colors.grey[300],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No products in this category',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemCount: products.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, prodIndex) {
                        final product = products[prodIndex];
                        return OfferCardProduct(product: product);
                      },
                    ),
            );
          }

          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: Colors.red[300]),
                    const SizedBox(height: 16),
                    Text(
                      state.categoriesState?.errorMessage ?? "Unknown Error",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.red[600]),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context.read<CategoiresViewModel>().fetchCategories();
                      },
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}