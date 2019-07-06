class Response<T> {
  String name;
  String message;
  int code;
  T data;
  String status;

  Response({this.name, this.message, this.code, this.data, this.status});

  Response.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    message = json['message'];
    code = json['code'];
    data = json['data'];
    status = json['status'];
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
