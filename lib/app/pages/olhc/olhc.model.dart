class OLHCModel {
  String date;
  double open;
  double high;
  double low;
  double close;
  double volume;

  OLHCModel({
    this.date,
    this.open,
    this.high,
    this.low,
    this.close,
    this.volume,
  });

  OLHCModel.fromJson(Map<String, dynamic> json) {
    date = json['Date'];
    open = toFloat(json['Open']);
    high = toFloat(json['High']);
    low = toFloat(json['Low']);
    close = toFloat(json['Close']);
    volume = toFloat(json['Volume']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Date'] = this.date;
    data['Open'] = this.open;
    data['High'] = this.high;
    data['Low'] = this.low;
    data['Close'] = this.close;
    data['Volume'] = this.volume;
    return data;
  }
}


toFloat(num value){
  return value + .0;
}