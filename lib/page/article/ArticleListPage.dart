import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutterwan/api/Api.dart';
import 'package:flutterwan/api/CommonService.dart';
import 'package:flutterwan/model/ProductsRepository.dart';
import 'package:flutterwan/model/bean/ArticleBean.dart';

import '../../product_row_item.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  // 列表视图（`ListView`）中要显示的数据。
  List questionnaireList = new List();
  EasyRefreshController _controller = EasyRefreshController();

  // 当前页数
  int pageno = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          //获取首页数据
          future: ProductsRepository.loadProducts(pageno),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //解析数据
              ArticleBean articleBean = ArticleBean.fromMap(snapshot.data);
              questionnaireList = articleBean.data.datas;
              return EasyRefresh(
                header: MaterialHeader(),
                footer: MaterialFooter(),
                child: _buildList(),
                onRefresh: _onRefresh,
                onLoad: _onLoad,
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
        ));
  }

  void _getMoreData() {
    try {
      ProductsRepository.loadProducts(pageno).then((value) {
        // 处理返回数据
        ArticleBean articleBean = ArticleBean.fromMap(value);
        List<DatasBean> products = articleBean.data.datas;
        setState(() {
          if (products.length > 0) {
            // print(totalPages);
            questionnaireList.addAll(products);
          } else {
            --pageno;
          }
        });
      });
    } on DioError catch (e) {
      //catch 提示
      print('catch 提示: ' + e.toString());
      if (e.response != null) {
        print(e.response.data);
        dynamic rtn = jsonDecode(e.response.data.toString()); // 解析接口返回的json数据
        // print(rtn['status']);
        if (rtn['status'] == 401) {
          //autoLogin().then((val) => initState()); // 自动登录后 调用initState更新页面
        }
      } else {
        //showToast("数据加载失败");
        print(e.request);
        print(e.message);
      }
    }
  }

  Future<Null> _onRefresh() {
    setState(() {
      pageno = 0;
      questionnaireList.clear();
    });

    _getMoreData();
  }

  Future<Null> _onLoad() {
    setState(() {
      pageno++;
    });
    _getMoreData();
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: questionnaireList.length,
        itemBuilder: (BuildContext context, int index) {
          //正常列表显示
          return new product_row_item(
            index: index,
            product: questionnaireList[index],
            lastItem: index == questionnaireList.length - 1,
          );
        });
  }
}
