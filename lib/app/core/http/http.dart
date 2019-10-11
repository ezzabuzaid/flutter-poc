import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/headers.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/logger.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/teardown.interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/url.interceptor.dart';

final http = HttpWithInterceptor.build(interceptors: [
  LogginInterceptor(),
  UrlInterceptor(),
  HeadersInterceptor(),
  TeardownInterceptor(),
]);

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
