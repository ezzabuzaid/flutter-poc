
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/app.constant.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';

class LogginInterceptor implements InterceptorContract {
  final reqeustsMetadata = Map<String, int>();
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    int started = DateTime.now().millisecond;
    reqeustsMetadata[data.url] = started;
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    final suffixURI = data.url.split(AppplicationConstants.baseEndpoint)[1];
    int elapsed = DateTime.now().millisecond - reqeustsMetadata[suffixURI];
    logger.i('Request for ${data.url} took $elapsed ms.');
    reqeustsMetadata.remove(suffixURI);
    return data;
  }
}