import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/core/http/index.dart';

class HeadersInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    EMutationRequest.values
        .forEach((value) => {removeHeader(data.headers, value)});
    String token = await TokenHelper().getToken();
    logger.i('Token is => $token');
    data.headers.putIfAbsent('authorization', () => token);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}
