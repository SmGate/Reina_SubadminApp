/// message : "success"
/// data : [{"id":1,"subadminid":2,"type":"apartment","unit":"sqft","charges":"5000.00","chargesafterduedate":"5250.00","appcharges":"100.00","tax":"750.00","area":"500.00","bedrooms":5,"status":0,"created_at":"2023-04-28T11:41:36.000000Z","updated_at":"2023-04-28T11:41:36.000000Z"},{"id":2,"subadminid":2,"type":"apartment","unit":"sqft","charges":"7000.00","chargesafterduedate":"7350.00","appcharges":"140.00","tax":"1050.00","area":"700.25","bedrooms":7,"status":0,"created_at":"2023-04-28T11:42:07.000000Z","updated_at":"2023-04-28T11:42:07.000000Z"}]

class MeasurementModel {
  MeasurementModel({
      this.message, 
      this.data,});

  MeasurementModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? message;
  List<Data>? data;
MeasurementModel copyWith({  String? message,
  List<Data>? data,
}) => MeasurementModel(  message: message ?? this.message,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// subadminid : 2
/// type : "apartment"
/// unit : "sqft"
/// charges : "5000.00"
/// chargesafterduedate : "5250.00"
/// appcharges : "100.00"
/// tax : "750.00"
/// area : "500.00"
/// bedrooms : 5
/// status : 0
/// created_at : "2023-04-28T11:41:36.000000Z"
/// updated_at : "2023-04-28T11:41:36.000000Z"

class Data {
  Data({
      this.id, 
      this.subadminid, 
      this.type, 
      this.unit, 
      this.charges, 
      this.chargesafterduedate, 
      this.appcharges, 
      this.tax, 
      this.area, 
      this.bedrooms, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    subadminid = json['subadminid'];
    type = json['type'];
    unit = json['unit'];
    charges = json['charges'];
    chargesafterduedate = json['chargesafterduedate'];
    appcharges = json['appcharges'];
    tax = json['tax'];
    area = json['area'];
    bedrooms = json['bedrooms'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? subadminid;
  String? type;
  String? unit;
  String? charges;
  String? chargesafterduedate;
  String? appcharges;
  String? tax;
  String? area;
  int? bedrooms;
  int? status;
  String? createdAt;
  String? updatedAt;
Data copyWith({  int? id,
  int? subadminid,
  String? type,
  String? unit,
  String? charges,
  String? chargesafterduedate,
  String? appcharges,
  String? tax,
  String? area,
  int? bedrooms,
  int? status,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? this.id,
  subadminid: subadminid ?? this.subadminid,
  type: type ?? this.type,
  unit: unit ?? this.unit,
  charges: charges ?? this.charges,
  chargesafterduedate: chargesafterduedate ?? this.chargesafterduedate,
  appcharges: appcharges ?? this.appcharges,
  tax: tax ?? this.tax,
  area: area ?? this.area,
  bedrooms: bedrooms ?? this.bedrooms,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['subadminid'] = subadminid;
    map['type'] = type;
    map['unit'] = unit;
    map['charges'] = charges;
    map['chargesafterduedate'] = chargesafterduedate;
    map['appcharges'] = appcharges;
    map['tax'] = tax;
    map['area'] = area;
    map['bedrooms'] = bedrooms;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}