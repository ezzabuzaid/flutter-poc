class SettingsModel {
  bool darkMode = false;
  bool notification = false;
  SettingsModel({
    this.darkMode,
    this.notification,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['darkMode'] = this.darkMode;
    data['notification'] = this.notification;
    return data;
  }

  factory SettingsModel.fromJson(Map<String, dynamic> json) {
    return SettingsModel(
      darkMode: json['darkMode'],
      notification: json['notification'],
    );
  }
}
