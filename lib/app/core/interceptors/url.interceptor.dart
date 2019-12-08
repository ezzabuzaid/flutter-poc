import 'package:dio/dio.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/app.constant.dart';
import 'package:learning_flutter/app/core/http/index.dart';

class UrlInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    // TODO: implement onError
    return err;
  }

  @override
  Future onRequest(RequestOptions options) async {
    if (getHeaderValue(options.headers, EMutationRequest.defaultUrl)) {
      options.baseUrl = AppplicationConstants.baseEndpoint + options.baseUrl;
    }
    return options;
  }

  @override
  Future onResponse(Response response) async {
    // TODO: implement onResponse
    return response;
  }
  // @override
  // Future<RequestData> interceptRequest({RequestData data}) async {
  // if (getHeaderValue(data.headers, EMutationRequest.defaultUrl)) {
  //   data.url = AppplicationConstants.baseEndpoint + data.url;
  // }
  //   return data;
  // }

  // @override
  // Future<ResponseData> interceptResponse({ResponseData data}) async {
  //   return data;
  // }
}
