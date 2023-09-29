import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoes_test_app/components/cart_item_.dart';
import 'package:shoes_test_app/components/catalogue_data_.dart';
import 'package:shoes_test_app/components/language_constants_.dart';
import 'package:shoes_test_app/components/auth_scope.dart';
import 'package:shoes_test_app/pages/home_page_.dart';

class Cart with ChangeNotifier {
  //list of shoes for sale that i has taken from the server
  //list of items in user cart
  Cart({
    required List<CartItem> initialCartItems,
  }) : userCart = initialCartItems;

  List<CartItem> userCart = [];
  //get cart
  List<CartItem> getUserCart() {
    return userCart;
  }

  void showErrorOrder(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ),
                );
              },
              child: Text(
                translation(context).go_shopping,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
          backgroundColor: Colors.red.shade600,
          titlePadding: const EdgeInsets.all(50),
          title: Text(
            translation(context).order_snackBar_without_items,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  void showOrderMg(BuildContext context) {
    final User? user = AuthScope.userOf(context);
    final snackBar = SnackBar(
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 210,
        left: 10,
        right: 10,
      ),
      showCloseIcon: true,
      // duration: Duration(seconds: 8),
      padding: const EdgeInsets.symmetric(vertical: 20),
      backgroundColor: Colors.green.shade600,
      content: Center(
        child: Text(
          '${translation(context).order_snackBar_with_items} ${user?.email?.split('@')[0].toString()}!',
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void clearCart(BuildContext context) {
    if (userCart.isNotEmpty) {
      showOrderMg(context);
      userCart.clear();
    } else {
      showErrorOrder(context);
    }
    notifyListeners();
    saveCart();
  }

  int get count => userCart.fold(
      0, (previousValue, element) => previousValue + element.count);
  void saveCart() async {
    final value = userCart.map<String>((e) => jsonEncode(e.toJson())).toList();
    (await SharedPreferences.getInstance()).setStringList('cart', value);
  }

  //add items to the cart
  void addItemToThecart(ShoesCatalogue2 shoe) {
    final int index =
        userCart.indexWhere((element) => element.product.id == shoe.id);
    if (index == -1) {
      userCart = [
        ...userCart,
        CartItem(count: 1, product: shoe),
      ];
    } else {
      final item = userCart[index];

      userCart = [
        ...userCart.slice(0, index),
        CartItem(count: item.count + 1, product: item.product),
        ...userCart.slice(index + 1),
      ];
    }
    notifyListeners();
    saveCart();
  }

  // void clearAll() {}
  //remove items from the cart
  void removeItemFromTheCart(ShoesCatalogue2 shoe) {
    final int index =
        userCart.indexWhere((element) => element.product.id == shoe.id);
    if (index == -1) {
      return;
    }
    final item = userCart[index];
    if (item.count == 1) {
      userCart =
          userCart.where((element) => element.product.id != shoe.id).toList();
    } else {
      userCart = [
        ...userCart.slice(0, index),
        CartItem(count: item.count - 1, product: item.product),
        ...userCart.slice(index + 1),
      ];
    }
    notifyListeners();
    saveCart();
  }
}
