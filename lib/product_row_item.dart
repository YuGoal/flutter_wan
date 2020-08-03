import 'package:flutter/cupertino.dart';
import 'package:flutterwan/model/bean/ArticleBean.dart';
import 'package:flutterwan/styles/styles.dart';


class product_row_item extends StatelessWidget {
  final DatasBean product;
  final int index;
  final bool lastItem;

  const product_row_item({this.product, this.index, this.lastItem});

  @override
  Widget build(BuildContext context) {
    final row = SafeArea(
      top: false,
      bottom: false,
      minimum: const EdgeInsets.only(
        left: 16,
        top: 8,
        bottom: 8,
        right: 8,
      ),
      child: Row(
        children: <Widget>[
          /*ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.network(
              product
              fit: BoxFit.cover,
              width: 76,
              height: 76,
            ),
          ),*/
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.title,
                    style: Styles.productRowItemName,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                  ),
                  Text(
                    product.author,
                    style: Styles.productRowItemPrice,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    if(lastItem){
      return row;
    }
    return Column(
      children: <Widget>[
        row,
        Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 16,
          ),
          child: Container(
            height: 1,
            color: Styles.productRowDivider,
          ),
        )
      ],
    );
  }
}
