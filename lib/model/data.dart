class model {
  int _status;
  D _d;

  model({int status, D d}) {
    this._status = status;
    this._d = d;
  }

  int get status => _status;
  set status(int status) => _status = status;
  D get d => _d;
  set d(D d) => _d = d;

  model.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _d = json['d'] != null ? new D.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._d != null) {
      data['d'] = this._d.toJson();
    }
    return data;
  }
}

class D {
  String _measurementId;
  String _neck;
  String _height;
  String _weight;
  String _belly;
  String _chest;
  String _wrist;
  String _armLength;
  String _thigh;
  String _shoulder;
  String _hips;
  String _ankle;

  D(
      {String measurementId,
        String neck,
        String height,
        String weight,
        String belly,
        String chest,
        String wrist,
        String armLength,
        String thigh,
        String shoulder,
        String hips,
        String ankle}) {
    this._measurementId = measurementId;
    this._neck = neck;
    this._height = height;
    this._weight = weight;
    this._belly = belly;
    this._chest = chest;
    this._wrist = wrist;
    this._armLength = armLength;
    this._thigh = thigh;
    this._shoulder = shoulder;
    this._hips = hips;
    this._ankle = ankle;
  }

  String get measurementId => _measurementId;
  set measurementId(String measurementId) => _measurementId = measurementId;
  String get neck => _neck;
  set neck(String neck) => _neck = neck;
  String get height => _height;
  set height(String height) => _height = height;
  String get weight => _weight;
  set weight(String weight) => _weight = weight;
  String get belly => _belly;
  set belly(String belly) => _belly = belly;
  String get chest => _chest;
  set chest(String chest) => _chest = chest;
  String get wrist => _wrist;
  set wrist(String wrist) => _wrist = wrist;
  String get armLength => _armLength;
  set armLength(String armLength) => _armLength = armLength;
  String get thigh => _thigh;
  set thigh(String thigh) => _thigh = thigh;
  String get shoulder => _shoulder;
  set shoulder(String shoulder) => _shoulder = shoulder;
  String get hips => _hips;
  set hips(String hips) => _hips = hips;
  String get ankle => _ankle;
  set ankle(String ankle) => _ankle = ankle;

  D.fromJson(Map<String, dynamic> json) {
    _measurementId = json['measurementId'];
    _neck = json['neck'];
    _height = json['height'];
    _weight = json['weight'];
    _belly = json['belly'];
    _chest = json['chest'];
    _wrist = json['wrist'];
    _armLength = json['armLength'];
    _thigh = json['thigh'];
    _shoulder = json['shoulder'];
    _hips = json['hips'];
    _ankle = json['ankle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['measurementId'] = this._measurementId;
    data['neck'] = this._neck;
    data['height'] = this._height;
    data['weight'] = this._weight;
    data['belly'] = this._belly;
    data['chest'] = this._chest;
    data['wrist'] = this._wrist;
    data['armLength'] = this._armLength;
    data['thigh'] = this._thigh;
    data['shoulder'] = this._shoulder;
    data['hips'] = this._hips;
    data['ankle'] = this._ankle;
    return data;
  }
}