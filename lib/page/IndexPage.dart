import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwan/page/SearchTab.dart';
import 'package:flutterwan/page/ShoppingCartTab.dart';

import 'article/ArticlePage.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.book), title: Text('文章')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.collections), title: Text('项目')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.tags), title: Text('体系')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('我的')),
  ];

  final List<Widget> tabBodies = [
    ArticlePage(),
    SearchTab(),
    ShoppingCartTab(),
    ArticlePage()
  ];

  var currentPage;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: bottomTabs,
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(builder: (context) {
          return CupertinoPageScaffold(
            child: currentPage = tabBodies[index],
          );
        });
      },
    );

    /* bottomNavigationBar: CupertinoTabBar(
        items: bottomTabs,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[index];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: tabBodies,
      ),*/
  }
}
