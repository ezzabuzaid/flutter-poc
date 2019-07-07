import 'dart:convert';

class Response<T> {
  String name;
  String message;
  int code;
  T data;
  String status;

  Response.fromJson(String undecoded) {
    final _json = json.decode(undecoded);
    name = _json['name'];
    message = _json['message'];
    code = _json['code'];
    data = json.decode(_json['data']);
    status = _json['status'];
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
