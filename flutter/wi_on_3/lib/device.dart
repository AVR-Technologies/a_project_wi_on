class Device {
  int id;
  String deviceName;
  String wifiName;
  String wifiPassword;
  Device({this.id, this.deviceName, this.wifiName, this.wifiPassword});
  toMap() => {
    'deviceName'    : this.deviceName,
    'wifiName'      : this.wifiName,
    'wifiPassword'  : this.wifiPassword,
  };
  Device.from(dynamic map) :
        this.id = map['id'],
        this.deviceName   = map['deviceName'],
        this.wifiName     = map['wifiName'],
        this.wifiPassword = map['wifiPassword'];
  Device.fromMap(Map<String, dynamic> map) :
        this.id = map['id'],
        this.deviceName         = map['deviceName'],
        this.wifiName     = map['wifiName'],
        this.wifiPassword = map['wifiPassword'];
}