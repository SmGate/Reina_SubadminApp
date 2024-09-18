class HouseResident {
  HouseResident({
    this.success,
    this.data,
  });

  HouseResident.fromJson(dynamic json) {
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
  HouseResident copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      HouseResident(
        success: success ?? this.success,
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
    this.societyid,
    this.pid,
    this.bid,
    this.sid,
    this.propertyid,
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
    this.society,
    this.phase,
    this.block,
    this.street,
    this.property,
    this.measurement,
    this.owner,
  });

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
    societyid = json['societyid'];
    pid = json['pid'];
    bid = json['bid'];
    sid = json['sid'];
    propertyid = json['propertyid'];
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
    // if (json['society'] != null) {
    //   society = [];
    //   (json['society'] as List).forEach((v) {
    //     society?.add(Society.fromJson(v));
    //   });
    // }

    if (json['society'] != null) {
      society = [];
      var societyData = json['society'];
      if (societyData is List) {
        societyData.forEach((v) {
          society?.add(Society.fromJson(v));
        });
      } else if (societyData is Map) {
        // Assuming you want to handle the single object case
        society?.add(Society.fromJson(societyData));
      } else {
        throw Exception(
            "Unexpected type for society: ${societyData.runtimeType}");
      }
    }

    if (json['phase'] != null) {
      phase = [];
      json['phase'].forEach((v) {
        phase?.add(Phase.fromJson(v));
      });
    }
    if (json['block'] != null) {
      block = [];
      json['block'].forEach((v) {
        block?.add(Block.fromJson(v));
      });
    }
    if (json['street'] != null) {
      street = [];
      json['street'].forEach((v) {
        street?.add(Street.fromJson(v));
      });
    }
    if (json['property'] != null) {
      property = [];
      json['property'].forEach((v) {
        property?.add(Property.fromJson(v));
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
  int? societyid;
  int? pid;
  int? bid;
  int? sid;
  int? propertyid;
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
  List<Society>? society;
  List<Phase>? phase;
  List<Block>? block;
  List<Street>? street;
  List<Property>? property;
  List<Measurement>? measurement;
  List<Owner>? owner;
  Data copyWith({
    int? id,
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
    int? societyid,
    int? pid,
    int? bid,
    int? sid,
    int? propertyid,
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
    List<Society>? society,
    List<Phase>? phase,
    List<Block>? block,
    List<Street>? street,
    List<Property>? property,
    List<Measurement>? measurement,
    List<Owner>? owner,
  }) =>
      Data(
        id: id ?? this.id,
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
        societyid: societyid ?? this.societyid,
        pid: pid ?? this.pid,
        bid: bid ?? this.bid,
        sid: sid ?? this.sid,
        propertyid: propertyid ?? this.propertyid,
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
        society: society ?? this.society,
        phase: phase ?? this.phase,
        block: block ?? this.block,
        street: street ?? this.street,
        property: property ?? this.property,
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
    map['societyid'] = societyid;
    map['pid'] = pid;
    map['bid'] = bid;
    map['sid'] = sid;
    map['propertyid'] = propertyid;
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
    if (society != null) {
      map['society'] = society?.map((v) => v.toJson()).toList();
    }
    if (phase != null) {
      map['phase'] = phase?.map((v) => v.toJson()).toList();
    }
    if (block != null) {
      map['block'] = block?.map((v) => v.toJson()).toList();
    }
    if (street != null) {
      map['street'] = street?.map((v) => v.toJson()).toList();
    }
    if (property != null) {
      map['property'] = property?.map((v) => v.toJson()).toList();
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

/// id : 2
/// residentid : 7
/// ownername : "noman"
/// owneraddress : "NA"
/// ownermobileno : "02134"
/// created_at : "2023-04-28T12:56:34.000000Z"
/// updated_at : "2023-04-28T12:56:34.000000Z"

class Owner {
  Owner({
    this.id,
    this.residentid,
    this.ownername,
    this.owneraddress,
    this.ownermobileno,
    this.createdAt,
    this.updatedAt,
  });

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
  Owner copyWith({
    int? id,
    int? residentid,
    String? ownername,
    String? owneraddress,
    String? ownermobileno,
    String? createdAt,
    String? updatedAt,
  }) =>
      Owner(
        id: id ?? this.id,
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

/// id : 3
/// subadminid : 6
/// type : "house"
/// unit : "marla"
/// charges : "5000.00"
/// chargesafterduedate : "5250.00"
/// appcharges : "100.00"
/// tax : "750.00"
/// area : "5.00"
/// bedrooms : 5
/// status : 0
/// created_at : "2023-04-28T12:56:15.000000Z"
/// updated_at : "2023-04-28T12:56:15.000000Z"

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
    this.updatedAt,
  });

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
  Measurement copyWith({
    int? id,
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
  }) =>
      Measurement(
        id: id ?? this.id,
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

/// id : 41
/// address : "House#1"
/// type : "street"
/// iteration : "1"
/// dynamicid : 3
/// subadminid : 6
/// societyid : 2
/// superadminid : 1
/// occupied : 0
/// created_at : "2023-04-28T12:54:33.000000Z"
/// updated_at : "2023-04-28T12:54:33.000000Z"

class Property {
  Property({
    this.id,
    this.address,
    this.type,
    this.iteration,
    this.dynamicid,
    this.subadminid,
    this.societyid,
    this.superadminid,
    this.occupied,
    this.createdAt,
    this.updatedAt,
  });

  Property.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    type = json['type'];
    iteration = json['iteration'];
    dynamicid = json['dynamicid'];
    subadminid = json['subadminid'];
    societyid = json['societyid'];
    superadminid = json['superadminid'];
    occupied = json['occupied'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? type;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  int? occupied;
  String? createdAt;
  String? updatedAt;
  Property copyWith({
    int? id,
    String? address,
    String? type,
    String? iteration,
    int? dynamicid,
    int? subadminid,
    int? societyid,
    int? superadminid,
    int? occupied,
    String? createdAt,
    String? updatedAt,
  }) =>
      Property(
        id: id ?? this.id,
        address: address ?? this.address,
        type: type ?? this.type,
        iteration: iteration ?? this.iteration,
        dynamicid: dynamicid ?? this.dynamicid,
        subadminid: subadminid ?? this.subadminid,
        societyid: societyid ?? this.societyid,
        superadminid: superadminid ?? this.superadminid,
        occupied: occupied ?? this.occupied,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['type'] = type;
    map['iteration'] = iteration;
    map['dynamicid'] = dynamicid;
    map['subadminid'] = subadminid;
    map['societyid'] = societyid;
    map['superadminid'] = superadminid;
    map['occupied'] = occupied;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 3
/// address : "Stret#1"
/// type : "blocks"
/// iteration : "1"
/// dynamicid : 3
/// subadminid : 6
/// societyid : 2
/// superadminid : 1
/// created_at : "2023-04-28T12:54:22.000000Z"
/// updated_at : "2023-04-28T12:54:22.000000Z"

class Street {
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

  Street.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    type = json['type'];
    iteration = json['iteration'];
    dynamicid = json['dynamicid'];
    subadminid = json['subadminid'];
    societyid = json['societyid'];
    superadminid = json['superadminid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? type;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  String? createdAt;
  String? updatedAt;
  Street copyWith({
    int? id,
    String? address,
    String? type,
    String? iteration,
    int? dynamicid,
    int? subadminid,
    int? societyid,
    int? superadminid,
    String? createdAt,
    String? updatedAt,
  }) =>
      Street(
        id: id ?? this.id,
        address: address ?? this.address,
        type: type ?? this.type,
        iteration: iteration ?? this.iteration,
        dynamicid: dynamicid ?? this.dynamicid,
        subadminid: subadminid ?? this.subadminid,
        societyid: societyid ?? this.societyid,
        superadminid: superadminid ?? this.superadminid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['type'] = type;
    map['iteration'] = iteration;
    map['dynamicid'] = dynamicid;
    map['subadminid'] = subadminid;
    map['societyid'] = societyid;
    map['superadminid'] = superadminid;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 3
/// address : "Block#1"
/// type : "phase"
/// iteration : "1"
/// dynamicid : 1
/// subadminid : 6
/// societyid : 2
/// superadminid : 1
/// created_at : "2023-04-28T12:54:09.000000Z"
/// updated_at : "2023-04-28T12:54:09.000000Z"

class Block {
  Block({
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

  Block.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    type = json['type'];
    iteration = json['iteration'];
    dynamicid = json['dynamicid'];
    subadminid = json['subadminid'];
    societyid = json['societyid'];
    superadminid = json['superadminid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? type;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  String? createdAt;
  String? updatedAt;
  Block copyWith({
    int? id,
    String? address,
    String? type,
    String? iteration,
    int? dynamicid,
    int? subadminid,
    int? societyid,
    int? superadminid,
    String? createdAt,
    String? updatedAt,
  }) =>
      Block(
        id: id ?? this.id,
        address: address ?? this.address,
        type: type ?? this.type,
        iteration: iteration ?? this.iteration,
        dynamicid: dynamicid ?? this.dynamicid,
        subadminid: subadminid ?? this.subadminid,
        societyid: societyid ?? this.societyid,
        superadminid: superadminid ?? this.superadminid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['type'] = type;
    map['iteration'] = iteration;
    map['dynamicid'] = dynamicid;
    map['subadminid'] = subadminid;
    map['societyid'] = societyid;
    map['superadminid'] = superadminid;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 1
/// address : "Phase#1"
/// iteration : "1"
/// dynamicid : 2
/// subadminid : 6
/// societyid : 2
/// superadminid : 1
/// created_at : "2023-04-28T12:53:57.000000Z"
/// updated_at : "2023-04-28T12:53:57.000000Z"

class Phase {
  Phase({
    this.id,
    this.address,
    this.iteration,
    this.dynamicid,
    this.subadminid,
    this.societyid,
    this.superadminid,
    this.createdAt,
    this.updatedAt,
  });

  Phase.fromJson(dynamic json) {
    id = json['id'];
    address = json['address'];
    iteration = json['iteration'];
    dynamicid = json['dynamicid'];
    subadminid = json['subadminid'];
    societyid = json['societyid'];
    superadminid = json['superadminid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? address;
  String? iteration;
  int? dynamicid;
  int? subadminid;
  int? societyid;
  int? superadminid;
  String? createdAt;
  String? updatedAt;
  Phase copyWith({
    int? id,
    String? address,
    String? iteration,
    int? dynamicid,
    int? subadminid,
    int? societyid,
    int? superadminid,
    String? createdAt,
    String? updatedAt,
  }) =>
      Phase(
        id: id ?? this.id,
        address: address ?? this.address,
        iteration: iteration ?? this.iteration,
        dynamicid: dynamicid ?? this.dynamicid,
        subadminid: subadminid ?? this.subadminid,
        societyid: societyid ?? this.societyid,
        superadminid: superadminid ?? this.superadminid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['address'] = address;
    map['iteration'] = iteration;
    map['dynamicid'] = dynamicid;
    map['subadminid'] = subadminid;
    map['societyid'] = societyid;
    map['superadminid'] = superadminid;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

/// id : 2
/// country : "🇵🇰    Pakistan"
/// state : "null"
/// city : "null"
/// area : "Islamabad"
/// type : "society"
/// name : "Bahria Town"
/// address : "Islamabad"
/// superadminid : 1
/// structuretype : 3
/// created_at : "2023-04-28T12:52:32.000000Z"
/// updated_at : "2023-04-28T12:52:32.000000Z"

class Society {
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
  });

  Society.fromJson(dynamic json) {
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
  Society copyWith({
    int? id,
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
  }) =>
      Society(
        id: id ?? this.id,
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
