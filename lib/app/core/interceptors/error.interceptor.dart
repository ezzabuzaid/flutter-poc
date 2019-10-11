import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/models.dart';

class ErrorInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}
