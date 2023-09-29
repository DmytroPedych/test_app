import 'package:flutter/material.dart';
import 'package:shoes_test_app/components/catalogue_data_.dart';
import 'package:http/http.dart' as http;

class CatalogController with ChangeNotifier {
  CatalogController({
    required IProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  final IProductsRepository _productsRepository;

  List<ShoesCatalogue2> _products = [];
  bool _isLoading = false;
  Object? _error;
  int _page = 1;

  List<ShoesCatalogue2> get products => _products;
  Object? get error => _error;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void fetchProducts() async {
    _error = null;
    if (_page == 1) {
      _setLoading(true);
    }
    try {
      _products = [
        ..._products,
        ...await _productsRepository.fetchProducts(page: _page),
      ];
      _page++;
    } on Object catch (e) {
      _error = e;
      rethrow;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> refresh() async {
    try {
      _error = null;
      _page = 1;
      _products = await _productsRepository.fetchProducts(page: _page);
      _page++;
    } on Object catch (e) {
      _error = e;
      rethrow;
    } finally {
      notifyListeners();
    }
  }
}

abstract interface class IProductsRepository {
  Future<List<ShoesCatalogue2>> fetchProducts({int page = 1, int limit = 20});
}

class ProductsRepository implements IProductsRepository {
  Future<List<ShoesCatalogue2>> fetchProducts(
      {int page = 1, int limit = 20}) async {
    final url = Uri.parse(
        'https://65080cbc56db83a34d9ba549.mockapi.io/api/catalogue2?limit=$limit&page=$page');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return shoesCatalogue2FromJson(response.body);
    }

    throw Exception('Error getting products');
  }
}
