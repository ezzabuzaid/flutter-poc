import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/core/helpers/utils.dart';

// NOTE get this from environment 

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

class FinalaizeResponesInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    logger.i('${data.method} || URL => ${data.url}');
    return data;
  }
}

class ErrorInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    // data.url = '$ENDPOINT_URI/${data.url}';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}

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

class HeadersInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    EMutationRequest.values
        .forEach((value) => {removeHeader(data.headers, value)});
    String token = await TokenHelper().getToken();
    logger.i('Token => $token');
    data.headers.putIfAbsent('authorization', () => token);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}
