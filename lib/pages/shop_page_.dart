// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_test_app/components/cart_.dart';
import 'package:shoes_test_app/components/catalog_controller_.dart';
import 'package:shoes_test_app/components/catalogue_data_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/shoe_tile_.dart';
import 'package:shoes_test_app/components/widgets_helper_.dart';
import 'package:shoes_test_app/pages/cart_page_.dart';
import 'package:shoes_test_app/pages/shoes_details_page_.dart';
import 'package:badges/badges.dart' as badges;

class ShopPage_ extends StatefulWidget {
  const ShopPage_({super.key});

  @override
  State<ShopPage_> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage_> {
  // //____________________________________________ add shoe to cart method
  // void addShoeToCart(ShoesCatalogue2 shoe) {
  //   Provider.of<Cart>(context, listen: false).addItemToThecart(shoe);
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: Center(
  //               child: Text("Successully added!"),
  //             ),
  //             backgroundColor: Colors.deepPurple[300],
  //             titlePadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
  //             content: Text('Check cart'),
  //             contentPadding:
  //                 EdgeInsets.symmetric(vertical: 20, horizontal: 20),
  //           ));
  // }

  void navigateToItemDetails(ShoesCatalogue2 item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoesDetailsPage(shoe: item),
      ),
    );
  }

  buttonCart() {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: EdgeInsets.only(left: 270, bottom: 10),
      decoration: BoxDecoration(
        color: isDark ? Colors.black : Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(2),
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 30, right: 30, top: 10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CartPage_();
                },
              ),
            );
          },
          child: badges.Badge(
            badgeContent: Text(context
                .watch<Cart>()
                .count
                .toString()), // watch смотрит и обновляет контент сразу
            child: const Icon(
              Icons.shopping_cart,
              size: 45,
            ),
          ),
        ),
      ),
    );
  }

  //controler for controls scrolling
  final controller = ScrollController();
  final _catalogController = CatalogController(
    productsRepository: ProductsRepository(),
  );
  @override
  void initState() {
    super.initState();
    _catalogController.fetchProducts();
    // fetch();
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {
        _catalogController.fetchProducts();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme_ = Theme.of(context).textTheme;
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Consumer<Cart>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translation(context).search_bar,
                      style:
                          TextStyle(color: isDark ? Colors.white : Colors.grey),
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: isDark ? Colors.white : Colors.grey,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  translation(context).slogan,
                  style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.grey[200] : Colors.grey[600],
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      translation(context).hot_pics,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Text(
                      translation(context).see_all,
                      style: textTheme_.headline4,
                    ),
                  ],
                ),
              ),
              addVerticalSpace(15),
              ListenableBuilder(
                listenable: _catalogController,
                builder: (context, child) {
                  if (_catalogController.isLoading) {
                    const Center(
                      child: RepaintBoundary(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (_catalogController.error != null) {
                    return const Center(
                      child: Text('Error'),
                    );
                  }

                  return Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: controller,
                      padding: const EdgeInsets.only(
                          bottom: 30, right: 15, left: 15, top: 0),
                      itemCount: _catalogController.products.length + 1,
                      itemBuilder: (context, index) {
                        if (index < _catalogController.products.length) {
                          final item = _catalogController.products[index];
                          return ShoeTile(
                            shoe: item,
                            onTap: () => navigateToItemDetails(item),
                          );
                        } else {
                          return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 25),
                              child: RepaintBoundary(
                                child: _catalogController.isLoading
                                    ? const Center(
                                        child: CircularProgressIndicator())
                                    : const Text('No more data to load'),
                              ));
                        }
                      },
                      separatorBuilder: (context, index) => const Divider(),
                    ),
                  );
                },
              ),
              buttonCart(),
            ],
          ),
        ),
      ),
    );
  }
}
