import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:shoes_test_app/components/cart_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/widgets_helper_.dart';
import 'package:shoes_test_app/components/auth_scope.dart';
import 'package:shoes_test_app/pages/home_page_.dart';
import 'package:shoes_test_app/pages/login_page_.dart';

class CartPage_ extends StatelessWidget {
  CartPage_({super.key});

  buttonArrow(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            ),
          );
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: isDark ? Colors.grey[700] : Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonCart() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 106),
      child: InkWell(
        onTap: () {},
        // watch смотрит и обновляет контент сразу
        child: const Icon(
          Icons.card_travel_rounded,
          size: 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final User? user = AuthScope.userOf(context);
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Consumer<Cart>(
      builder: (context, cart, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  buttonArrow(context),
                  //______________ heading
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: buttonCart(),
                  ),
                ],
              ),
              addVerticalSpace(20),
              Expanded(
                child: ListView.builder(
                  itemCount: cart.getUserCart().length,
                  itemBuilder: (context, index) {
                    final individualShoe = cart.getUserCart()[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? Theme.of(context).colorScheme.secondary
                              : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          //shoe: individualShoe.product,
                          onTap: () {
                            cart.removeItemFromTheCart(individualShoe.product);
                          },
                          leading: Image.network(
                            individualShoe.product.imgUrl,
                          ),
                          // CircleAvatar(
                          //   backgroundImage: NetworkImage(
                          //       individualShoe.product.imgUrl,
                          //       scale: 0.9),
                          //   radius: 35,
                          // ),
                          title: Text(
                            '${translation(context).brand}: ${individualShoe.product.brand} | ${translation(context).model}: ${individualShoe.product.title}',
                            style: TextStyle(
                                color: isDark ? Colors.grey[200] : Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                          subtitle: Text(
                            '${translation(context).quantity}: ${individualShoe.count.toString()}',
                            style: TextStyle(
                                color: isDark ? Colors.grey[100] : Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (user != null)
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55, right: 55, top: 0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 80)),
                        ),
                        onPressed: () {
                          // delete all products
                          cart.clearCart(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            addGorizontalSpace(10),
                            Text(
                              '${translation(context).order_button} (${context.watch<Cart>().count.toString()})',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_right_sharp,
                              size: 40,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              else
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55, right: 55, top: 0),
                    child: Center(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.black,
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(const Size(200, 80)),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginPage(onTap: () {}),
                            ),
                          );
                        },
                        child: Text(
                          translation(context).log_in_cart,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
