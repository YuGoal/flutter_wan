import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutterwan/model/bean/ArticleBean.dart';
import 'package:flutterwan/model/ProductsRepository.dart';
import 'package:flutterwan/product_row_item.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder(
        //获取首页数据
        future: ProductsRepository.loadProducts(0),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //解析数据
            ArticleBean articleBean = ArticleBean.fromMap(snapshot.data);
            List<DatasBean> products = articleBean.data.datas;

            return CustomScrollView(
              semanticChildCount: products.length,
              slivers: <Widget>[
                CupertinoSliverNavigationBar(
                  largeTitle: Text('玩Android · 文章'),
                ),
                SliverSafeArea(
                  // BEGINNING OF NEW CONTENT
                  top: false,
                  minimum: const EdgeInsets.only(top: 8),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index < products.length) {
                          return product_row_item(
                            index: index,
                            product: products[index],
                            lastItem: index == products.length - 1,
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ) // END OF NEW CONTENT
              ],
            );
          } else {
            return Align(
              alignment: Alignment.center,
              child: CupertinoActivityIndicator(
                animating: true,
                radius: 12,
              ),
            );
          }
        },
      ),
    );
  }
}
