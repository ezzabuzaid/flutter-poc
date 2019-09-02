enum EMutationRequest {
  defaultUrl,
}

Map<String, String> prepareHeader(Map<EMutationRequest, bool> headers) {
  return headers.map((key, value) {
    return MapEntry(key.toString(), value.toString());
  });
}

getHeaderValue(Map<String, String> headers, EMutationRequest header) {
  return headers[header.toString()] != 'false';
}

removeHeader(Map<String, String> headers, EMutationRequest header) {
  if (headers.containsKey(header.toString())) {
    headers.remove(header.toString());
  }
}
