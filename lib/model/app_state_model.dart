import 'package:flutter/foundation.dart' as foundation;
import 'package:flutterwan/model/ProductsRepository.dart';
import 'bean/ArticleBean.dart';

class AppStateModel extends foundation.ChangeNotifier {


  // Loads the list of available products from the repo.
  static List<DatasBean> getArticle(int page) {
    ProductsRepository.loadProducts(page);
  }

}
