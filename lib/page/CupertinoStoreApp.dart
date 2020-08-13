import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'article/ArticleListPage.dart';
import 'article/ArticlePage.dart';

class CupertinoStoreApp extends StatefulWidget {
  _CupertinoStoreAppState createState() => _CupertinoStoreAppState();
}

class _CupertinoStoreAppState extends State<CupertinoStoreApp> {

  PageController _pageController;

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.book),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.collections),
      title: Text('项目'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.tags),
      title: Text('体系'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('我的'),
    ),
  ];
  List<Widget> tabBodies = [
    ArticleListPage(),
    ArticleListPage(),
    ArticleListPage(),
    ArticleListPage()
  ];

  int currentIndex = 0;

  @override
  void initState() {
    _pageController = new PageController(initialPage: this.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: new AlwaysScrollableScrollPhysics(),
        controller: _pageController,
        children: tabBodies,
        onPageChanged: onPageChanged,
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 300), curve: Curves.ease);
          });
        },
      ),
    );
  }


  PageView buildBodyFunction() {
    //左右滑
    return PageView(
      onPageChanged: (int index) {
        setState(() {
          currentIndex = index;
        });
      },
      //值为flase时 显示第一个页面 然后从左向右开始滑动
      //值为true时 显示最后一个页面 然后从右向左开始滑动
      reverse: false,
      //滑动到页面底部无回弹效果
      physics: BouncingScrollPhysics(),
      //横向滑动切换
      scrollDirection: Axis.horizontal,
      //页面控制器
      controller: _pageController,
      //所有的子Widget
      children: tabBodies,
    );
  }

  void onPageChanged(int value) {
    setState(() {
      this.currentIndex = value;
    });
  }
}

