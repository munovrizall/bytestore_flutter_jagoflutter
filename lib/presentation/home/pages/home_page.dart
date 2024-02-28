import 'package:byte_store/core/assets/assets.gen.dart';
import 'package:byte_store/core/components/components.dart';
import 'package:byte_store/core/router/app_router.dart';
import 'package:byte_store/presentation/home/bloc/all_product/all_product_bloc.dart';
import 'package:byte_store/presentation/home/bloc/best_seller_product/best_seller_product_bloc.dart';
import 'package:byte_store/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:byte_store/presentation/home/bloc/special_offer_product/special_offer_product_bloc.dart';
import 'package:byte_store/presentation/home/models/product_model.dart';
import 'package:byte_store/presentation/home/models/store_model.dart';
import 'package:byte_store/presentation/home/widgets/banner_slider.dart';
import 'package:byte_store/presentation/home/widgets/organism/menu_categories.dart';
import 'package:byte_store/presentation/home/widgets/organism/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  late TextEditingController searchController;

  final List<String> banners1 = [
    Assets.images.banner1.path,
    Assets.images.banner1.path,
  ];

  final List<String> banners2 = [
    Assets.images.banner2.path,
    Assets.images.banner2.path,
    Assets.images.banner2.path,
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    context.read<AllProductBloc>().add(const AllProductEvent.getAllProducts());
    context
        .read<BestSellerProductBloc>()
        .add(const BestSellerProductEvent.getBestSellerProducts());
    context
        .read<SpecialOfferProductBloc>()
        .add(const SpecialOfferProductEvent.getSpecialOfferProducts());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Byte Store'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(height: 24),
          ),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (checkout, _, __, ___, ____, _____) {
                  final totalQuantity = checkout.fold<int>(
                      0,
                      (previousValue, element) =>
                          previousValue + element.quantity);

                  return totalQuantity > 0
                      ? badges.Badge(
                          badgeContent: Text(
                            totalQuantity.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(
                                RouteConstants.cart,
                                pathParameters: PathParameters().toMap(),
                              );
                            },
                            icon: Assets.icons.cart.svg(height: 24),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            context.goNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          icon: Assets.icons.cart.svg(height: 24),
                        );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                RouteConstants.root,
                pathParameters:
                    PathParameters(rootTab: RootTab.explore).toMap(),
              );
            },
          ),
          const SpaceHeight(16),
          BannerSlider(items: banners1),
          const SpaceHeight(12),
          const MenuCategories(),
          const SpaceHeight(50),
          BlocBuilder<AllProductBloc, AllProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                    title: 'Featured Product',
                    onSeeAllTap: () {},
                    items:
                        products.length > 2 ? products.sublist(0, 2) : products,
                  );
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          const SpaceHeight(50),
          BannerSlider(items: banners2),
          const SpaceHeight(28),
          BlocBuilder<BestSellerProductBloc, BestSellerProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Best Sellers',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
          // const SpaceHeight(50),
          // ProductList(
          //   title: 'New Arrivals',
          //   onSeeAllTap: () {},
          //   items: newArrivals,
          // ),
          // const SpaceHeight(50),
          // ProductList(
          //   title: 'Top Rated Product',
          //   onSeeAllTap: () {},
          //   items: topRatedProducts,
          // ),
          const SpaceHeight(50),
          BlocBuilder<SpecialOfferProductBloc, SpecialOfferProductState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (products) {
                  return ProductList(
                      title: 'Special Offer',
                      onSeeAllTap: () {},
                      items: products.length > 2
                          ? products.sublist(0, 2)
                          : products);
                },
                orElse: () => const SizedBox.shrink(),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (message) => Center(
                  child: Text(message),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
