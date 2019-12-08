import 'package:dio/dio.dart';
import 'package:learning_flutter/app/core/helpers/utils.dart';
import 'package:learning_flutter/app/core/http/index.dart';

class OHLCService {
  Future connectToOhlcSocketHttpEndpoint(String name) {
    return http.get(
      'https://node-buildozer.herokuapp.com/socket/$name',
      options: Options(headers: prepareHeader({EMutationRequest.defaultUrl: false})),
    );
  }
}
