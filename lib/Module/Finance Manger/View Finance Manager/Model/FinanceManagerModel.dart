/// success : true
/// data : [{"id":8,"financemanagerid":8,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T17:29:36.000000Z","updated_at":"2023-06-01T17:29:36.000000Z","firstname":"omer","lastname":"rajq","cnic":"6996","address":"fg","mobileno":"0321550979","password":"$2y$10$FMc9mVQlUbtCJnQ6vm7us.fv3ZKBJIdNwD.7/j6Smm1/6fYi5sJfG","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":9,"financemanagerid":9,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T17:30:26.000000Z","updated_at":"2023-06-01T17:30:26.000000Z","firstname":"omer","lastname":"rajq","cnic":"69966","address":"fg","mobileno":"0321550979","password":"$2y$10$8lPezwO2oqPo8c7g.PpC8.2fdYFSD9v5P5EFK58zqDoeRFF2zBbgO","roleid":6,"rolename":"financemanager","image":"1685640626.jpg","fcmtoken":null},{"id":10,"financemanagerid":10,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T17:39:26.000000Z","updated_at":"2023-06-01T17:39:26.000000Z","firstname":"vg","lastname":"gg","cnic":"131331","address":"hwy","mobileno":"6464","password":"$2y$10$RXhEnpCuTz4OWW3NvQBJBeFnlfJBFAyamPuN4mlo2gcvlqLzC.x3W","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":11,"financemanagerid":11,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T17:57:01.000000Z","updated_at":"2023-06-01T17:57:01.000000Z","firstname":"suus","lastname":"hshs","cnic":"7676","address":"yaya","mobileno":"9767","password":"$2y$10$C3djUclY04MEhTR7.49I2uYQucmn5jwBQs49E/013z3dd7loUVneG","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":13,"financemanagerid":13,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T18:33:08.000000Z","updated_at":"2023-06-01T18:33:08.000000Z","firstname":"uu","lastname":"hh","cnic":"692","address":"ggg","mobileno":"99","password":"$2y$10$dpn3mqzPQ7dKRAwSM1hK2eTli5AHoMjOLUOMzM2iKiOcEIlZvBn6O","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":14,"financemanagerid":14,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T18:37:57.000000Z","updated_at":"2023-06-01T18:37:57.000000Z","firstname":"uu","lastname":"hh","cnic":"888","address":"cf","mobileno":"99","password":"$2y$10$TEhPaP580U0vIBSZGwgrXu7XfaCIj4JI1dww11/A0tvh/6/6U8L/S","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":15,"financemanagerid":15,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-01T18:51:35.000000Z","updated_at":"2023-06-01T18:51:35.000000Z","firstname":"uu","lastname":"hh","cnic":"85","address":"cf","mobileno":"99","password":"$2y$10$8Sjxi..wTrqgvh9wpQVSmOA3.zg3x7CrrTKgRJI3yhovDR1JWKZT.","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":16,"financemanagerid":16,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-02T10:21:55.000000Z","updated_at":"2023-06-02T10:21:55.000000Z","firstname":"nnn","lastname":"jj","cnic":"3","address":"hh","mobileno":"6","password":"$2y$10$Zz4a3lgGd.vCGu.ZyLWkE.e/0m2p/HPiWldsYX5cFx/jLPi4Rt7Xq","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null},{"id":17,"financemanagerid":17,"subadminid":2,"superadminid":1,"societyid":1,"status":"active","created_at":"2023-06-02T10:23:17.000000Z","updated_at":"2023-06-02T10:23:17.000000Z","firstname":"yy","lastname":"tt","cnic":"33","address":"gg","mobileno":"63","password":"$2y$10$Jl5nbcOwk6..N21FKLoMp.4F9sCEjkqs1J5Zx2Y0dNkwHljB91n/K","roleid":6,"rolename":"financemanager","image":"images/user.png","fcmtoken":null}]

class FinanceManagerModel {
  FinanceManagerModel({
    this.success,
    this.data,
  });

  FinanceManagerModel.fromJson(dynamic json) {
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
  FinanceManagerModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      FinanceManagerModel(
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

/// id : 8
/// financemanagerid : 8
/// subadminid : 2
/// superadminid : 1
/// societyid : 1
/// status : "active"
/// created_at : "2023-06-01T17:29:36.000000Z"
/// updated_at : "2023-06-01T17:29:36.000000Z"
/// firstname : "omer"
/// lastname : "rajq"
/// cnic : "6996"
/// address : "fg"
/// mobileno : "0321550979"
/// password : "$2y$10$FMc9mVQlUbtCJnQ6vm7us.fv3ZKBJIdNwD.7/j6Smm1/6fYi5sJfG"
/// roleid : 6
/// rolename : "financemanager"
/// image : "images/user.png"
/// fcmtoken : null

class Data {
  Data({
    this.id,
    this.financemanagerid,
    this.subadminid,
    this.superadminid,
    this.societyid,
    this.status,
    this.createdAt,
    this.updatedAt,
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
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    financemanagerid = json['financemanagerid'];
    subadminid = json['subadminid'];
    superadminid = json['superadminid'];
    societyid = json['societyid'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
  }
  int? id;
  int? financemanagerid;
  int? subadminid;
  int? superadminid;
  int? societyid;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  String? password;
  int? roleid;
  String? rolename;
  String? image;
  dynamic fcmtoken;
  Data copyWith({
    int? id,
    int? financemanagerid,
    int? subadminid,
    int? superadminid,
    int? societyid,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? firstname,
    String? lastname,
    String? cnic,
    String? address,
    String? mobileno,
    String? password,
    int? roleid,
    String? rolename,
    String? image,
    dynamic fcmtoken,
  }) =>
      Data(
        id: id ?? this.id,
        financemanagerid: financemanagerid ?? this.financemanagerid,
        subadminid: subadminid ?? this.subadminid,
        superadminid: superadminid ?? this.superadminid,
        societyid: societyid ?? this.societyid,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
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
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['financemanagerid'] = financemanagerid;
    map['subadminid'] = subadminid;
    map['superadminid'] = superadminid;
    map['societyid'] = societyid;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
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
    return map;
  }
}
