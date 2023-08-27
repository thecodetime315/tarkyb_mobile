class SettingsModel {
  String? displayName;
  String? key;
  String? value;

  SettingsModel({this.displayName, this.key, this.value});

  SettingsModel.fromJson(Map<String, dynamic> json) {
    displayName = json['display_name'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_name'] = this.displayName;
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
