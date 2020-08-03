import 'package:flutterwan/api/Api.dart';
import 'package:flutterwan/api/CommonService.dart';

class ProductsRepository {
  static Future loadProducts(int page) {
    return requestGet("${Api.ARTICLE}$page/json");
  }
}
