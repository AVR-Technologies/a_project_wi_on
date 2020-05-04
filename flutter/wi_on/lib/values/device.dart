class Device {
  String deviceName;
  String deviceWifiName;
  String deviceWifiPassword;
  String deviceIconColor;
  Device({this.deviceName, this.deviceWifiName, this.deviceWifiPassword, this.deviceIconColor = "#404040" });
  toMap() => {
    'deviceName'         : this.deviceName ,
    'deviceWifiName'     : this.deviceWifiName,
    'deviceWifiPassword' : this.deviceWifiPassword,
    'deviceIconColor'    : this.deviceIconColor,
  };
  Device.fromDynamic(dynamic map) :
        this.deviceName         = map['deviceName'],
        this.deviceWifiName     = map['deviceWifiName'],
        this.deviceWifiPassword = map['deviceWifiPassword'],
        this.deviceIconColor    = map['deviceIconColor'];
  Device.fromMap(Map<String, String> map) :
        this.deviceName         = map['deviceName'],
        this.deviceWifiName     = map['deviceWifiName'],
        this.deviceWifiPassword = map['deviceWifiPassword'],
        this.deviceIconColor    = map['deviceIconColor'];
}
////kotlin standard for device class
//
////kotlin standard function
//ReturnType run<ReturnType>(ReturnType operation()) => operation();
////Used for evaluating a block of several statements where an expression is required.
////someNullable ?? run(() {
////var defaultValue = ......;
////// several process...
////return defaultValue;
////});
//extension ScopeFunctionsForObject<T extends Object> on Device {
//  ReturnType let<ReturnType>(ReturnType letFunction(Device it)) => letFunction(this);
//  //main value can be changed
//  //print("super".let((it)=>it+="man"));
//  //output:   superman
//  //
//  //"super".let((it)=>print(it+="man"));
//  //output:   superman
//  Device also(void alsoFunction(Device it)) {
//    alsoFunction(this);
//    return this;
//  }
////main value can not be changed
////print("super".also((it)=>it+="man"));
////output:   super
////
////"super".also((it)=>print(it+="man"));
////output:   superman
//}