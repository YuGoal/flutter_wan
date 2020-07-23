import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'IndexPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Wan',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(primaryColor: Colors.blue),
      home: IndexPage(),
    );
  }
}
