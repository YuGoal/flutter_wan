import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterwan/page/CupertinoStoreApp.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Container(
      child: MaterialApp(
        title: "玩Android",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blueAccent),
        home: CupertinoStoreApp(),
      ),
    );
  }
}
