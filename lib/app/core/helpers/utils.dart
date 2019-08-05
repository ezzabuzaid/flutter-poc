class MutationRequest {
  static final defaultUrl = 'defaultUrl';
}

enum EMutationRequest {
  defaultUrl,
}

Map<String, String> prepareHeader(Map<String, dynamic> headers) {
  return headers.map((key, value) {
    return MapEntry(key, value.toString());
  });
}