import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/models/models.dart';

class TeardownInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}
