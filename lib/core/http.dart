import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/core/interceptor.dart';

final http = HttpWithInterceptor.build(interceptors: [
  UrlInterceptor(),
  LogginInterceptor(),
]);
