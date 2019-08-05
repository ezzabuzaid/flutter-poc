import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/core/helpers/utils.dart';

// NOTE get this from environment
class LogginInterceptor implements InterceptorContract {
  Map logging = Map<String, int>();
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    int started = DateTime.now().millisecond;
    logging[data.url] = started;
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    // NOTE you need to ser id for each request in order to obtain the starter time
    // data.url will not work since we change it in url interceptor

    // int elapsed = DateTime.now().millisecond - int.parse(logging[data.url]);
    print('Request for ${data.url} took ${logging[data.url]} ms.');
    logging.remove(data.url);
    return data;
  }
}

class UrlInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    if (data.headers[MutationRequest.defaultUrl] != 'false') {
      data.url = Uri.https('node-buildozer.herokuapp.com', '/api/${data.url}')
          .toString();
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
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
    if (data.method == Method.POST ||
        data.method == Method.PATCH ||
        data.method == Method.PUT) {
      Builder(
        builder: (context) {
          return SnackBar(
            content: Text('Proccessing request'),
          );
        },
      ).build(null);
    }
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
    removeHeader(data.headers, MutationRequest.defaultUrl);
    String token = await TokenHelper().getToken();
    data.headers.putIfAbsent(MutationRequest.authorization, () => token);
    logger.d(token);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}

removeHeader(headers, key) {
  if (headers.containsKey(key)) {
    headers.remove(key);
  }
}
