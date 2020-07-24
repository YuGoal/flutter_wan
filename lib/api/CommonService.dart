import 'package:dio/dio.dart';
import 'package:flutterwan/api/Api.dart';

class CommonService {
  Future<Response> getArticleListData(int page) async {
    return await Dio()
        .get("${Api.ARTICLE}$page/json");
  }
}

