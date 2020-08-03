import 'package:dio/dio.dart';


//get 请求
Future requestGet(url) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    response = await dio.get(url);
    if (200 == response.statusCode) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}

//post 请求
Future requestPost(url, {formData}) async {
  try {
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = "application/x-www-form-urlencoded";
    if (formData == null) {
      response = await dio.post(url);
    } else {
      response = await dio.post(url, data: formData);
    }
    print(formData);
    if (200 == response.statusCode) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>${e}');
  }
}
