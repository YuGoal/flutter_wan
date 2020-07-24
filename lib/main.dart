import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwan/model/app_state_model.dart';
import 'package:flutterwan/page/CupertinoStoreApp.dart';
import 'package:flutterwan/page/SearchTab.dart';
import 'package:flutterwan/page/ShoppingCartTab.dart';
import 'package:flutterwan/page/article/ArticlePage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AppStateModel>(
      builder: (context) => AppStateModel()..loadProducts(),
      child: CupertinoStoreApp(), // NEW
    ),
  );
}
