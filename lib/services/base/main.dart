import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:async';

Options options = new Options(
  baseUrl: "http://10.10.1.26:9100",
  connectTimeout: 5000,
  receiveTimeout: 5000
);

Dio dio = new Dio(options);

// dio.interceptor.request.onSend = (Options options){
//      // 在请求被发送之前做一些事情
//      return options; //continue
//      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
//      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
//      //
//      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
//      // 这样请求将被中止并触发异常，上层catchError会被调用。
//  };
//  dio.interceptor.response.onSuccess = (Response response) {
//      // 在返回响应数据之前做一些预处理
//      return response; // continue
//  };
//  dio.interceptor.response.onError = (DioError e){
//      // 当请求失败时做一些预处理
//      return e;//continue
//  };
 
class HTTP {
  Future<Map> get(url) async {
    Response response = await dio.get(url);
    return json.decode(response.data);
  }
}
