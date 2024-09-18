// To parse this JSON data, do
//
//     final houseUnverifiedResident = houseUnverifiedResidentFromJson(jsonString);

import 'dart:convert';

HouseUnverifiedResident houseUnverifiedResidentFromJson(String str) =>
    HouseUnverifiedResident.fromJson(json.decode(str));

String houseUnverifiedResidentToJson(HouseUnverifiedResident data) =>
    json.encode(data.toJson());

class HouseUnverifiedResident {
  bool? success;
  List<Datum>? data;

  HouseUnverifiedResident({
    this.success,
    this.data,
  });

  factory HouseUnverifiedResident.fromJson(Map<String, dynamic> json) =>
      HouseUnverifiedResident(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  int? residentid;
  int? subadminid;
  String? username;
  String? country;
  String? state;
  String? city;
  String? houseaddress;
  String? vechileno;
  String? residenttype;
  String? propertytype;
  String? visibility;
  int? committeemember;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? societyid;
  int? pid;
  int? bid;
  int? sid;
  int? propertyid;
  int? measurementid;
  String? firstname;
  String? lastname;
  dynamic email;
  dynamic cnic;
  String? address;
  String? mobileno;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  String? fcmtoken;
  Society? society;
  List<dynamic>? phase;
  List<dynamic>? block;
  List<Street>? street;
  List<Measurement>? measurement;
  List<Owner>? owner;

  Datum({
    this.id,
    this.residentid,
    this.subadminid,
    this.username,
    this.country,
    this.state,
    this.city,
    this.houseaddress,
    this.vechileno,
    this.residenttype,
    this.propertytype,
    this.visibility,
    this.committeemember,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.societyid,
    this.pid,
    this.bid,
    this.sid,
    this.propertyid,
    this.measurementid,
    this.firstname,
    this.lastname,
    this.email,
    this.cnic,
    this.address,
    this.mobileno,
    this.password,
    this.roleid,
    this.rolename,
    this.image,
    this.fcmtoken,
    this.society,
    this.phase,
    this.block,
    this.street,
    this.measurement,
    this.owner,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        residentid: json["residentid"],
        subadminid: json["subadminid"],
        username: json["username"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        houseaddress: json["houseaddress"],
        vechileno: json["vechileno"],
        residenttype: json["residenttype"],
        propertytype: json["propertytype"],
        visibility: json["visibility"],
        committeemember: json["committeemember"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        societyid: json["societyid"],
        pid: json["pid"],
        bid: json["bid"],
        sid: json["sid"],
        propertyid: json["propertyid"],
        measurementid: json["measurementid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        cnic: json["cnic"],
        address: json["address"],
        mobileno: json["mobileno"],
        password: json["password"],
        roleid: json["roleid"],
        rolename: json["rolename"],
        image: json["image"],
        fcmtoken: json["fcmtoken"],
        society:
            json["society"] == null ? null : Society.fromJson(json["society"]),
        phase: json["phase"] == null
            ? []
            : List<dynamic>.from(json["phase"]!.map((x) => x)),
        block: json["block"] == null
            ? []
            : List<dynamic>.from(json["block"]!.map((x) => x)),
        street: json["street"] == null
            ? []
            : List<Street>.from(json["street"]!.map((x) => Street.fromJson(x))),
        measurement: json["measurement"] == null
            ? []
            : List<Measurement>.from(
                json["measurement"]!.map((x) => Measurement.fromJson(x))),
        owner: json["owner"] == null
            ? []
            : List<Owner>.from(json["owner"]!.map((x) => Owner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "residentid": residentid,
        "subadminid": subadminid,
        "username": username,
        "country": country,
        "state": state,
        "city": city,
        "houseaddress": houseaddress,
        "vechileno": vechileno,
        "residenttype": residenttype,
        "propertytype": propertytype,
        "visibility": visibility,
        "committeemember": committeemember,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "societyid": societyid,
        "pid": pid,
        "bid": bid,
        "sid": sid,
        "propertyid": propertyid,
        "measurementid": measurementid,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "cnic": cnic,
        "address": address,
        "mobileno": mobileno,
        "password": password,
        "roleid": roleid,
        "rolename": rolename,
        "image": image,
        "fcmtoken": fcmtoken,
        "society": society?.toJson(),
        "phase": phase == null ? [] : List<dynamic>.from(phase!.map((x) => x)),
        "block": block == null ? [] : List<dynamic>.from(block!.map((x) => x)),
        "street": street == null
            ? []
            : List<dynamic>.from(street!.map((x) => x.toJson())),
        "measurement": measurement == null
            ? []
            : List<dynamic>.from(measurement!.map((x) => x.toJson())),
        "owner": owner == null
            ? []
            : List<dynamic>.from(owner!.map((x) => x.toJson())),
      };
}

class Measurement {
  int? id;
  int? subadminid;
  String? type;
  String? unit;
  String? charges;
  String? latecharges;
  String? appcharges;
  String? tax;
  String? area;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Measurement({
    this.id,
    this.subadminid,
    this.type,
    this.unit,
    this.charges,
    this.latecharges,
    this.appcharges,
    this.tax,
    this.area,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
        id: json["id"],
        subadminid: json["subadminid"],
        type: json["type"],
        unit: json["unit"],
        charges: json["charges"],
        latecharges: json["latecharges"],
        appcharges: json["appcharges"],
        tax: json["tax"],
        area: json["area"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subadminid": subadminid,
        "type": type,
        "unit": unit,
        "charges": charges,
        "latecharges": latecharges,
        "appcharges": appcharges,
        "tax": tax,
        "area": area,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Owner {
  int? id;
  int? residentid;
  String? ownername;
  String? owneraddress;
  String? ownermobileno;
  DateTime? createdAt;
  DateTime? updatedAt;

  Owner({
    this.id,
    this.residentid,
    this.ownername,
    this.owneraddress,
    this.ownermobileno,
    this.createdAt,
    this.updatedAt,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        residentid: json["residentid"],
        ownername: json["ownername"],
        owneraddress: json["owneraddress"],
        ownermobileno: json["ownermobileno"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "residentid": residentid,
        "ownername": ownername,
        "owneraddress": owneraddress,
        "ownermobileno": ownermobileno,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Society {
  int? id;
  String? country;
  String? state;
  String? city;
  String? area;
  String? type;
  String? name;
  String? address;
  int? superadminid;
  int? structuretype;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? laravelThroughKey;

  Society({
    this.id,
    this.country,
    this.state,
    this.city,
    this.area,
    this.type,
    this.name,
    this.address,
    this.superadminid,
    this.structuretype,
    this.createdAt,
    this.updatedAt,
    this.laravelThroughKey,
  });

  factory Society.fromJson(Map<String, dynamic> json) => Society(
        id: json["id"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        area: json["area"],
        type: json["type"],
        name: json["name"],
        address: json["address"],
        superadminid: json["superadminid"],
        structuretype: json["structuretype"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        laravelThroughKey: json["laravel_through_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "state": state,
        "city": city,
        "area": area,
        "type": type,
        "name": name,
        "address": address,
        "superadminid": superadminid,
        "structuretype": structuretype,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "laravel_through_key": laravelThroughKey,
      };
}

class Street {
  int? id;
  String? address;
  String? type;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  DateTime? createdAt;
  DateTime? updatedAt;

  Street({
    this.id,
    this.address,
    this.type,
    this.iteration,
    this.dynamicid,
    this.subadminid,
    this.societyid,
    this.superadminid,
    this.createdAt,
    this.updatedAt,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        id: json["id"],
        address: json["address"],
        type: json["type"],
        iteration: json["iteration"],
        dynamicid: json["dynamicid"],
        subadminid: json["subadminid"],
        societyid: json["societyid"],
        superadminid: json["superadminid"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "type": type,
        "iteration": iteration,
        "dynamicid": dynamicid,
        "subadminid": subadminid,
        "societyid": societyid,
        "superadminid": superadminid,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
