import 'package:flutterwan/model/product.dart';

class ProductsRepository {
  static const _allProdicts = <Product>[
    Product(
      category: Category.accessories,
      id: 0,
      isFeatured: true,
      name: 'Vagabond sack',
      price: 120,
    ),
    Product(
      category: Category.home,
      id: 1,
      isFeatured: true,
      name: 'Gilt desk trio',
      price: 58,
    ),
    Product(
      category: Category.clothing,
      id: 2,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.clothing,
      id: 30,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.clothing,
      id: 4,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.accessories,
      id: 5,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.clothing,
      id: 6,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 42,
    ),
    Product(
      category: Category.clothing,
      id: 7,
      isFeatured: true,
      name: 'Cerise scallop tee',
      price: 48,
    ),
  ];

  static List<Product> loadProducts(Category category) {
    if (category == Category.all) {
      return _allProdicts;
    } else {
      return _allProdicts
          .where((element) => element.category == category)
          .toList();
    }
  }
}
