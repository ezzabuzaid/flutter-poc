import 'package:dio/dio.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/app.constant.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';

class LogginInterceptor implements Interceptor {
  final reqeustsMetadata = Map<String, int>();

  @override
  Future onError(DioError err) async {
    // TODO: implement onError
    return err;
  }

  @override
  Future onRequest(RequestOptions options) async {
    logger.wtf('Request Body => ${options.data}');
    return options;
  }

  @override
  Future onResponse(Response response) async {
    logger.wtf('Response Body => ${response.data}');
    return response;
  }
  // @override
  // Future<RequestData> interceptRequest({RequestData data}) async {
  //   int started = DateTime.now().millisecond;
  //   // reqeustsMetadata[data.url] = started;
  //   logger.wtf('Request Body => ${data.body}');
  //   return data;
  // }

  // @override
  // Future<ResponseData> interceptResponse({ResponseData data}) async {
  //   // final suffixURI = data.url.split(AppplicationConstants.baseEndpoint)[1];
  //   // int elapsed = DateTime.now().millisecond - reqeustsMetadata[suffixURI];
  //   // logger.i('Request for ${data.url} took $elapsed ms.');
  //   // reqeustsMetadata.remove(suffixURI);
  //   logger.wtf('Response Body => ${data.body}');
  //   return data;
  // }
}
