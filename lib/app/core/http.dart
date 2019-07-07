import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/interceptor.dart';

final http = HttpWithInterceptor.build(interceptors: [
  UrlInterceptor(),
  // LogginInterceptor(),
]);
