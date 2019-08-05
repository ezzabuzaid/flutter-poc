import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/interceptors/interceptor.dart';

final http = HttpWithInterceptor.build(interceptors: [
  UrlInterceptor(),
  HeadersInterceptor(),
  FinalaizeResponesInterceptor(),
  // LogginInterceptor(),
]);
