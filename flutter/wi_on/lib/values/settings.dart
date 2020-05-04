class Settings {
  bool  darkMode;
  int   colorIndex;
  bool  shakeDetectorEnable;
  bool  timeOutEnable;
  int   shakeIntensity;         // 0 ~ 100
  int   timeOutDelay;           // 10sec ~ 60sec
  Settings({this.darkMode = false, this.colorIndex = 10, this.shakeDetectorEnable = false, this.timeOutEnable = false, this.shakeIntensity = 100, this.timeOutDelay = 10});
  toMap() => {
    'darkMode'            : this.darkMode,
    'colorIndex'          : this.colorIndex,
    'shakeDetectorEnable' : this.shakeDetectorEnable,
    'timeOutEnable'       : this.timeOutEnable,
    'shakeIntensity'      : this.shakeIntensity,
    'timeOutDelay'        : this.timeOutDelay
  };
  Settings.fromMap(Map<String, dynamic> map) :
        this.darkMode             = map['darkMode'],
        this.colorIndex           = map['colorIndex'],
        this.shakeDetectorEnable  = map['shakeDetectorEnable'],
        this.timeOutEnable        = map['timeOutEnable'],
        this.shakeIntensity       = map['shakeIntensity'],
        this.timeOutDelay         = map['timeOutDelay'];
  Settings.fromDynamic(dynamic map) :
        this.darkMode             = map['darkMode'],
        this.colorIndex           = map['colorIndex'],
        this.shakeDetectorEnable  = map['shakeDetectorEnable'],
        this.timeOutEnable        = map['timeOutEnable'],
        this.shakeIntensity       = map['shakeIntensity'],
        this.timeOutDelay         = map['timeOutDelay'];
}