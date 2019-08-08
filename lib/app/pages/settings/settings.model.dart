class SettingsModel {
  bool theme = true;
  bool notification = true;
  SettingsModel({this.theme,this.notification,});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['theme'] = this.theme;
    data['notification'] = this.notification;
    return data;
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(theme: json['theme'],notification:json['notification'],);
  }
}
