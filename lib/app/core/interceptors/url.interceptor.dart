import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/app.constant.dart';
import 'package:learning_flutter/app/core/helpers/utils.dart';

class UrlInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    if (getHeaderValue(data.headers, EMutationRequest.defaultUrl)) {
      data.url = AppplicationConstants.baseEndpoint + data.url;
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}
