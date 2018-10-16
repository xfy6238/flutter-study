import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

Options options = new Options(
    baseUrl: "http://192.168.1.105:9100",
    connectTimeout: 5000,
    receiveTimeout: 5000);

class HTTP {
  Dio dio = new Dio(options);

  BuildContext context;

  bool needToken = false;

  HTTP({@required this.context, this.needToken}) {
    dio.interceptor.request.onSend = (Options options) {
      this.showLoading(this.context);
      return options;
    };
    dio.interceptor.response.onSuccess = (Response response) {
      this.hideLoading(context);
      return response;
    };
    dio.interceptor.response.onError = (DioError e) {
      this.hideLoading(context);
      return e;
    };
  }

  Future<Map> get(url) async {
    Response response = await dio.get(url);
    return json.decode(response.data);
  }

  Future<Map> post(url, Map<String, dynamic> data) async {
    Response response = await dio.post(url, data: json.encode(data));
    return json.decode(response.data);
  }

  showLoading(context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: Container(
              width: 180.0,
              height: 180.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
  }

  hideLoading(context) {
    Navigator.pop(context);
  }
}
