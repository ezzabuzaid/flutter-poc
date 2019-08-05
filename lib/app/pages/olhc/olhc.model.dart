class OLHCModel {
  String date;
  double open;
  double high;
  double low;
  double close;

  OLHCModel({
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
  });

  factory OLHCModel.fromJson(Map<String, dynamic> json) {
    return OLHCModel(
        close: toFloat(json['Close']),
        date: json['Date'],
        high: toFloat(json['High']),
        open: toFloat(json['Open']),
        low: toFloat(json['Low']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Open'] = this.open;
    data['High'] = this.high;
    data['Low'] = this.low;
    data['Close'] = this.close;
    return data;
  }
}

toFloat(dynamic value) {
  return num.parse(value) + .0;
}

class SocketResponseModel {
  String name;
  OLHCModel data;

  SocketResponseModel({this.data, this.name});

  SocketResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    data = json['data'] != null ? OLHCModel.fromJson(json['data']) : null;
  }
}
