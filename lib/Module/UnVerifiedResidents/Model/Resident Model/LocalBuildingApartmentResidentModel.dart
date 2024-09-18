/// success : true
/// data : [{"id":10,"residentid":10,"subadminid":9,"country":"🇵🇰    Pakistan","state":"null","city":"null","houseaddress":"Saima Building, Floor 1,Apartment 1","vechileno":"","residenttype":"Rental","propertytype":"localbuildingapartment","committeemember":0,"status":0,"created_at":"2023-04-28T14:07:20.000000Z","updated_at":"2023-04-28T14:07:54.000000Z","localbuildingid":3,"fid":1,"aid":1,"measurementid":5,"firstname":"Fozia","lastname":"Khan","cnic":"321","address":"---","mobileno":"032155507979","password":"$2y$10$e2SS0EJQKSF7pCtKuFG1pevpTaz3cIYbxqN0y8zhCn.nQ1pgPvnH2","roleid":3,"rolename":"resident","image":"images/user.png","fcmtoken":"doicq4q0TNyYXYxTFmd9y1:APA91bFKdUD1wINNJwS1ftsKJf1F15whdGvtPJiykgy8s-qSIyf1HDc8eHHxWEjZZyBe8SBBkAgEIUWErt47lgX1_9FqyPM6VNmJndo7RMUYYpXj9Z4YTyR71y5BB5jnqhnLNsC1OIZ9","localbuilding":[{"id":3,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","area":"Karachi","type":"building","name":"Saima Building","address":"jdjd","superadminid":1,"structuretype":4,"created_at":"2023-04-28T14:04:38.000000Z","updated_at":"2023-04-28T14:04:38.000000Z"}],"localbuildingfloor":[{"id":1,"name":"Floor 1","buildingid":3,"subadminid":9,"created_at":"2023-04-28T14:05:54.000000Z","updated_at":"2023-04-28T14:05:54.000000Z"}],"localbuildingapartment":[{"id":1,"localbuildingfloorid":1,"name":"Apartment 1","occupied":0,"created_at":"2023-04-28T14:06:00.000000Z","updated_at":"2023-04-28T14:06:00.000000Z"}],"measurement":[{"id":5,"subadminid":9,"type":"apartment","unit":"sqft","charges":"4000.00","chargesafterduedate":"4200.00","appcharges":"80.00","tax":"600.00","area":"400.50","bedrooms":4,"status":0,"created_at":"2023-04-28T14:06:43.000000Z","updated_at":"2023-04-28T14:06:43.000000Z"}],"owner":[{"id":4,"residentid":10,"ownername":"Noman","owneraddress":"NA","ownermobileno":"0321818","created_at":"2023-04-28T14:07:54.000000Z","updated_at":"2023-04-28T14:07:54.000000Z"}]}]

class LocalBuildingApartmentResidentModel {
  LocalBuildingApartmentResidentModel({
      this.success, 
      this.data,});

  LocalBuildingApartmentResidentModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  bool? success;
  List<Data>? data;
LocalBuildingApartmentResidentModel copyWith({  bool? success,
  List<Data>? data,
}) => LocalBuildingApartmentResidentModel(  success: success ?? this.success,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 10
/// residentid : 10
/// subadminid : 9
/// country : "🇵🇰    Pakistan"
/// state : "null"
/// city : "null"
/// houseaddress : "Saima Building, Floor 1,Apartment 1"
/// vechileno : ""
/// residenttype : "Rental"
/// propertytype : "localbuildingapartment"
/// committeemember : 0
/// status : 0
/// created_at : "2023-04-28T14:07:20.000000Z"
/// updated_at : "2023-04-28T14:07:54.000000Z"
/// localbuildingid : 3
/// fid : 1
/// aid : 1
/// measurementid : 5
/// firstname : "Fozia"
/// lastname : "Khan"
/// cnic : "321"
/// address : "---"
/// mobileno : "032155507979"
/// password : "$2y$10$e2SS0EJQKSF7pCtKuFG1pevpTaz3cIYbxqN0y8zhCn.nQ1pgPvnH2"
/// roleid : 3
/// rolename : "resident"
/// image : "images/user.png"
/// fcmtoken : "doicq4q0TNyYXYxTFmd9y1:APA91bFKdUD1wINNJwS1ftsKJf1F15whdGvtPJiykgy8s-qSIyf1HDc8eHHxWEjZZyBe8SBBkAgEIUWErt47lgX1_9FqyPM6VNmJndo7RMUYYpXj9Z4YTyR71y5BB5jnqhnLNsC1OIZ9"
/// localbuilding : [{"id":3,"country":"🇵🇰    Pakistan","state":"Punjab","city":"Rawalpindi","area":"Karachi","type":"building","name":"Saima Building","address":"jdjd","superadminid":1,"structuretype":4,"created_at":"2023-04-28T14:04:38.000000Z","updated_at":"2023-04-28T14:04:38.000000Z"}]
/// localbuildingfloor : [{"id":1,"name":"Floor 1","buildingid":3,"subadminid":9,"created_at":"2023-04-28T14:05:54.000000Z","updated_at":"2023-04-28T14:05:54.000000Z"}]
/// localbuildingapartment : [{"id":1,"localbuildingfloorid":1,"name":"Apartment 1","occupied":0,"created_at":"2023-04-28T14:06:00.000000Z","updated_at":"2023-04-28T14:06:00.000000Z"}]
/// measurement : [{"id":5,"subadminid":9,"type":"apartment","unit":"sqft","charges":"4000.00","chargesafterduedate":"4200.00","appcharges":"80.00","tax":"600.00","area":"400.50","bedrooms":4,"status":0,"created_at":"2023-04-28T14:06:43.000000Z","updated_at":"2023-04-28T14:06:43.000000Z"}]
/// owner : [{"id":4,"residentid":10,"ownername":"Noman","owneraddress":"NA","ownermobileno":"0321818","created_at":"2023-04-28T14:07:54.000000Z","updated_at":"2023-04-28T14:07:54.000000Z"}]

class Data {
  Data({
      this.id, 
      this.residentid, 
      this.subadminid, 
      this.country, 
      this.state, 
      this.city, 
      this.houseaddress, 
      this.vechileno, 
      this.residenttype, 
      this.propertytype, 
      this.committeemember, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.localbuildingid, 
      this.fid, 
      this.aid, 
      this.measurementid, 
      this.firstname, 
      this.lastname, 
      this.cnic, 
      this.address, 
      this.mobileno, 
      this.password, 
      this.roleid, 
      this.rolename, 
      this.image, 
      this.fcmtoken, 
      this.localbuilding, 
      this.localbuildingfloor, 
      this.localbuildingapartment, 
      this.measurement, 
      this.owner,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    residentid = json['residentid'];
    subadminid = json['subadminid'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    houseaddress = json['houseaddress'];
    vechileno = json['vechileno'];
    residenttype = json['residenttype'];
    propertytype = json['propertytype'];
    committeemember = json['committeemember'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    localbuildingid = json['localbuildingid'];
    fid = json['fid'];
    aid = json['aid'];
    measurementid = json['measurementid'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    cnic = json['cnic'];
    address = json['address'];
    mobileno = json['mobileno'];
    password = json['password'];
    roleid = json['roleid'];
    rolename = json['rolename'];
    image = json['image'];
    fcmtoken = json['fcmtoken'];
    if (json['localbuilding'] != null) {
      localbuilding = [];
      json['localbuilding'].forEach((v) {
        localbuilding?.add(Localbuilding.fromJson(v));
      });
    }
    if (json['localbuildingfloor'] != null) {
      localbuildingfloor = [];
      json['localbuildingfloor'].forEach((v) {
        localbuildingfloor?.add(Localbuildingfloor.fromJson(v));
      });
    }
    if (json['localbuildingapartment'] != null) {
      localbuildingapartment = [];
      json['localbuildingapartment'].forEach((v) {
        localbuildingapartment?.add(Localbuildingapartment.fromJson(v));
      });
    }
    if (json['measurement'] != null) {
      measurement = [];
      json['measurement'].forEach((v) {
        measurement?.add(Measurement.fromJson(v));
      });
    }
    if (json['owner'] != null) {
      owner = [];
      json['owner'].forEach((v) {
        owner?.add(Owner.fromJson(v));
      });
    }
  }
  int? id;
  int? residentid;
  int? subadminid;
  String? country;
  String? state;
  String? city;
  String? houseaddress;
  String? vechileno;
  String? residenttype;
  String? propertytype;
  int? committeemember;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? localbuildingid;
  int? fid;
  int? aid;
  int? measurementid;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  String? fcmtoken;
  List<Localbuilding>? localbuilding;
  List<Localbuildingfloor>? localbuildingfloor;
  List<Localbuildingapartment>? localbuildingapartment;
  List<Measurement>? measurement;
  List<Owner>? owner;
Data copyWith({  int? id,
  int? residentid,
  int? subadminid,
  String? country,
  String? state,
  String? city,
  String? houseaddress,
  String? vechileno,
  String? residenttype,
  String? propertytype,
  int? committeemember,
  int? status,
  String? createdAt,
  String? updatedAt,
  int? localbuildingid,
  int? fid,
  int? aid,
  int? measurementid,
  String? firstname,
  String? lastname,
  String? cnic,
  String? address,
  String? mobileno,
  String? password,
  int? roleid,
  String? rolename,
  String? image,
  String? fcmtoken,
  List<Localbuilding>? localbuilding,
  List<Localbuildingfloor>? localbuildingfloor,
  List<Localbuildingapartment>? localbuildingapartment,
  List<Measurement>? measurement,
  List<Owner>? owner,
}) => Data(  id: id ?? this.id,
  residentid: residentid ?? this.residentid,
  subadminid: subadminid ?? this.subadminid,
  country: country ?? this.country,
  state: state ?? this.state,
  city: city ?? this.city,
  houseaddress: houseaddress ?? this.houseaddress,
  vechileno: vechileno ?? this.vechileno,
  residenttype: residenttype ?? this.residenttype,
  propertytype: propertytype ?? this.propertytype,
  committeemember: committeemember ?? this.committeemember,
  status: status ?? this.status,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  localbuildingid: localbuildingid ?? this.localbuildingid,
  fid: fid ?? this.fid,
  aid: aid ?? this.aid,
  measurementid: measurementid ?? this.measurementid,
  firstname: firstname ?? this.firstname,
  lastname: lastname ?? this.lastname,
  cnic: cnic ?? this.cnic,
  address: address ?? this.address,
  mobileno: mobileno ?? this.mobileno,
  password: password ?? this.password,
  roleid: roleid ?? this.roleid,
  rolename: rolename ?? this.rolename,
  image: image ?? this.image,
  fcmtoken: fcmtoken ?? this.fcmtoken,
  localbuilding: localbuilding ?? this.localbuilding,
  localbuildingfloor: localbuildingfloor ?? this.localbuildingfloor,
  localbuildingapartment: localbuildingapartment ?? this.localbuildingapartment,
  measurement: measurement ?? this.measurement,
  owner: owner ?? this.owner,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['residentid'] = residentid;
    map['subadminid'] = subadminid;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['houseaddress'] = houseaddress;
    map['vechileno'] = vechileno;
    map['residenttype'] = residenttype;
    map['propertytype'] = propertytype;
    map['committeemember'] = committeemember;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['localbuildingid'] = localbuildingid;
    map['fid'] = fid;
    map['aid'] = aid;
    map['measurementid'] = measurementid;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['cnic'] = cnic;
    map['address'] = address;
    map['mobileno'] = mobileno;
    map['password'] = password;
    map['roleid'] = roleid;
    map['rolename'] = rolename;
    map['image'] = image;
    map['fcmtoken'] = fcmtoken;
    if (localbuilding != null) {
      map['localbuilding'] = localbuilding?.map((v) => v.toJson()).toList();
    }
    if (localbuildingfloor != null) {
      map['localbuildingfloor'] = localbuildingfloor?.map((v) => v.toJson()).toList();
    }
    if (localbuildingapartment != null) {
      map['localbuildingapartment'] = localbuildingapartment?.map((v) => v.toJson()).toList();
    }
    if (measurement != null) {
      map['measurement'] = measurement?.map((v) => v.toJson()).toList();
    }
    if (owner != null) {
      map['owner'] = owner?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// residentid : 10
/// ownername : "Noman"
/// owneraddress : "NA"
/// ownermobileno : "0321818"
/// created_at : "2023-04-28T14:07:54.000000Z"
/// updated_at : "2023-04-28T14:07:54.000000Z"

class Owner {
  Owner({
      this.id, 
      this.residentid, 
      this.ownername, 
      this.owneraddress, 
      this.ownermobileno, 
      this.createdAt, 
      this.updatedAt,});

  Owner.fromJson(dynamic json) {
    id = json['id'];
    residentid = json['residentid'];
    ownername = json['ownername'];
    owneraddress = json['owneraddress'];
    ownermobileno = json['ownermobileno'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? residentid;
  String? ownername;
  String? owneraddress;
  String? ownermobileno;
  String? createdAt;
  String? updatedAt;
Owner copyWith({  int? id,
  int? residentid,
  String? ownername,
  String? owneraddress,
  String? ownermobileno,
  String? createdAt,
  String? updatedAt,
}) => Owner(  id: id ?? this.id,
  residentid: residentid ?? this.residentid,
  ownername: ownername ?? this.ownername,
  owneraddress: owneraddress ?? this.owneraddress,
  ownermobileno: ownermobileno ?? this.ownermobileno,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['residentid'] = residentid;
    map['ownername'] = ownername;
    map['owneraddress'] = owneraddress;
    map['ownermobileno'] = ownermobileno;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 5
/// subadminid : 9
/// type : "apartment"
/// unit : "sqft"
/// charges : "4000.00"
/// chargesafterduedate : "4200.00"
/// appcharges : "80.00"
/// tax : "600.00"
/// area : "400.50"
/// bedrooms : 4
/// status : 0
/// created_at : "2023-04-28T14:06:43.000000Z"
/// updated_at : "2023-04-28T14:06:43.000000Z"

class Measurement {
  Measurement({
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

  Measurement.fromJson(dynamic json) {
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
Measurement copyWith({  int? id,
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
}) => Measurement(  id: id ?? this.id,
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

/// id : 1
/// localbuildingfloorid : 1
/// name : "Apartment 1"
/// occupied : 0
/// created_at : "2023-04-28T14:06:00.000000Z"
/// updated_at : "2023-04-28T14:06:00.000000Z"

class Localbuildingapartment {
  Localbuildingapartment({
      this.id, 
      this.localbuildingfloorid, 
      this.name, 
      this.occupied, 
      this.createdAt, 
      this.updatedAt,});

  Localbuildingapartment.fromJson(dynamic json) {
    id = json['id'];
    localbuildingfloorid = json['localbuildingfloorid'];
    name = json['name'];
    occupied = json['occupied'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? localbuildingfloorid;
  String? name;
  int? occupied;
  String? createdAt;
  String? updatedAt;
Localbuildingapartment copyWith({  int? id,
  int? localbuildingfloorid,
  String? name,
  int? occupied,
  String? createdAt,
  String? updatedAt,
}) => Localbuildingapartment(  id: id ?? this.id,
  localbuildingfloorid: localbuildingfloorid ?? this.localbuildingfloorid,
  name: name ?? this.name,
  occupied: occupied ?? this.occupied,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['localbuildingfloorid'] = localbuildingfloorid;
    map['name'] = name;
    map['occupied'] = occupied;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 1
/// name : "Floor 1"
/// buildingid : 3
/// subadminid : 9
/// created_at : "2023-04-28T14:05:54.000000Z"
/// updated_at : "2023-04-28T14:05:54.000000Z"

class Localbuildingfloor {
  Localbuildingfloor({
      this.id, 
      this.name, 
      this.buildingid, 
      this.subadminid, 
      this.createdAt, 
      this.updatedAt,});

  Localbuildingfloor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    buildingid = json['buildingid'];
    subadminid = json['subadminid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  int? buildingid;
  int? subadminid;
  String? createdAt;
  String? updatedAt;
Localbuildingfloor copyWith({  int? id,
  String? name,
  int? buildingid,
  int? subadminid,
  String? createdAt,
  String? updatedAt,
}) => Localbuildingfloor(  id: id ?? this.id,
  name: name ?? this.name,
  buildingid: buildingid ?? this.buildingid,
  subadminid: subadminid ?? this.subadminid,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['buildingid'] = buildingid;
    map['subadminid'] = subadminid;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}

/// id : 3
/// country : "🇵🇰    Pakistan"
/// state : "Punjab"
/// city : "Rawalpindi"
/// area : "Karachi"
/// type : "building"
/// name : "Saima Building"
/// address : "jdjd"
/// superadminid : 1
/// structuretype : 4
/// created_at : "2023-04-28T14:04:38.000000Z"
/// updated_at : "2023-04-28T14:04:38.000000Z"

class Localbuilding {
  Localbuilding({
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
      this.updatedAt,});

  Localbuilding.fromJson(dynamic json) {
    id = json['id'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    area = json['area'];
    type = json['type'];
    name = json['name'];
    address = json['address'];
    superadminid = json['superadminid'];
    structuretype = json['structuretype'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
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
  String? createdAt;
  String? updatedAt;
Localbuilding copyWith({  int? id,
  String? country,
  String? state,
  String? city,
  String? area,
  String? type,
  String? name,
  String? address,
  int? superadminid,
  int? structuretype,
  String? createdAt,
  String? updatedAt,
}) => Localbuilding(  id: id ?? this.id,
  country: country ?? this.country,
  state: state ?? this.state,
  city: city ?? this.city,
  area: area ?? this.area,
  type: type ?? this.type,
  name: name ?? this.name,
  address: address ?? this.address,
  superadminid: superadminid ?? this.superadminid,
  structuretype: structuretype ?? this.structuretype,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country'] = country;
    map['state'] = state;
    map['city'] = city;
    map['area'] = area;
    map['type'] = type;
    map['name'] = name;
    map['address'] = address;
    map['superadminid'] = superadminid;
    map['structuretype'] = structuretype;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}