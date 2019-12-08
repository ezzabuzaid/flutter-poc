import 'package:dio/dio.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/interceptors/headers.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/logger.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/teardown.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/url.interceptor.dart';

// final http = HttpWithInterceptor.build(interceptors: [
//   // LogginInterceptor(),
//   // UrlInterceptor(),
//   // HeadersInterceptor(),
//   // TeardownInterceptor(),
// ]);
final http = Dio()
  ..options.baseUrl = 'https://node-buildozer.herokuapp.com/api/'
  ..interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options) {
        logger.wtf('Request URI => ${options.uri}');
        logger.wtf('Request Body => ${options.data}');
      },
      onResponse: (Response res) {
        logger.wtf('Response Body => ${res.data}');
      },
      // onError: (DioError res) {
      //   logger.wtf('Response Body => ${res.toString()}');
      // },
    ),
  )
  ..interceptors.add(UrlInterceptor())
  ..interceptors.add(LogginInterceptor());
enum EMutationRequest {
  defaultUrl,
}

Map<String, String> prepareHeader(Map<EMutationRequest, bool> headers) {
  return headers.map((key, value) {
    return MapEntry(key.toString(), value.toString());
  });
}

getHeaderValue(Map<String, String> headers, EMutationRequest header) {
  return headers[header.toString()] != 'false';
}

removeHeader(Map<String, String> headers, EMutationRequest header) {
  if (headers.containsKey(header.toString())) {
    headers.remove(header.toString());
  }
}
