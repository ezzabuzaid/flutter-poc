import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/utils.dart';
import 'package:learning_flutter/app/core/index.dart';

class OHLCService {
  Future connectToOhlcSocketHttpEndpoint(String name) {
    logger.i("Connection to http.get('ohlc')");
    return http.get(
      'https://node-buildozer.herokuapp.com/socket/$name',
      headers: prepareHeader({
        MutationRequest.defaultUrl: false,
      }),
    );
  }
}