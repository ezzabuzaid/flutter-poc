import 'dart:convert';

class Response<T> {
  final String name;
  final String message;
  final int code;
  List<T> data;
  final String status;

  Response({
    this.name,
    this.message,
    this.code,
    this.data,
    this.status,
  });

  factory Response.fromJson(String undecoded) {
    final _json = json.decode(undecoded);
    return Response(
      name: _json['name'],
      message: _json['message'],
      code: _json['code'],
      data: _json['data'],
      status: _json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['message'] = this.message;
    data['code'] = this.code;
    data['data'] = this.data;
    data['status'] = this.status;
    return data;
  }
}
