import 'package:flutter/cupertino.dart';
import 'package:flutterwan/model/app_state_model.dart';
import 'package:provider/provider.dart';
import 'package:flutterwan/product_row_item.dart';

class ArticlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Consumer<AppStateModel>(
        builder: (context, model, child) {
          final products = model.getProducts();
          return CustomScrollView(
            semanticChildCount: products.length,
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                largeTitle: Text('Cupertino Store'),
              ),
              SliverSafeArea(      // BEGINNING OF NEW CONTENT
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
              )                  // END OF NEW CONTENT
            ],
          );
        },
      ),
    );
  }
}