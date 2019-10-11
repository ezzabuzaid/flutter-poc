import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';

// NOTE get this from environment 


class MutationInterceptor implements InterceptorContract {
  configure(options) {
    logger.d(options);
  }

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    logger.w("MutationInterceptor Working");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // data.body = json.decode(data.body);
    return data;
  }
}