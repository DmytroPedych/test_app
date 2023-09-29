import 'package:shoes_test_app/components/catalogue_data_.dart';

class CartItem {
  CartItem({required this.count, required this.product});

  final int count;
  final ShoesCatalogue2 product;

  Map<String, Object?> toJson() {
    return {
      'count': count,
      'product': product.toJson(),
    };
  }

  factory CartItem.fromJson(Map<String, Object?> json) {
    return CartItem(
      count: json['count'] as int,
      product:
          ShoesCatalogue2.fromJson(json['product'] as Map<String, Object?>),
    );
  }
}
