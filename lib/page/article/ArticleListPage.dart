import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwan/model/ProductsRepository.dart';
import 'package:flutterwan/model/bean/ArticleBean.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  // 列表视图（`ListView`）中要显示的数据。
  List questionnaireList = new List();

  ScrollController _scrollController = new ScrollController();

  bool isLoading = true;

  // 总页数
  int totalPages = 1;

  // 当前页数
  int pageno = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _getMoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('玩Android · 文章'),
      ),
      body: Container(

      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  void _getMoreData() async {
    if (isLoading) {
      try {
        await ProductsRepository.loadProducts(pageno).then((value) {
          var data = json.decode(value.toString());
          ArticleBean articleBean = ArticleBean.fromMap(data);
          setState(() {
            // 处理返回数据
            // 总页数
            totalPages = articleBean.data.total;
            print(totalPages);
            questionnaireList.addAll(articleBean.data.datas);
            print(questionnaireList);
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
          print(e.request);
          print(e.message);
        }
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
