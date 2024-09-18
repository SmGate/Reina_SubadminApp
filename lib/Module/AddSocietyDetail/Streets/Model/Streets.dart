class Streets {
  Streets({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  Streets.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.address,
    required this.type,
    required this.iteration,
    required this.dynamicid,
    required this.subadminid,
    required this.societyid,
    required this.superadminid,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String address;
  late final String type;
  late final String iteration;
  late final int dynamicid;
  late final int subadminid;
  late final int societyid;
  late final int superadminid;
  late final String createdAt;
  late final String updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['address'] = address;
    _data['type'] = type;
    _data['iteration'] = iteration;
    _data['dynamicid'] = dynamicid;
    _data['subadminid'] = subadminid;
    _data['societyid'] = societyid;
    _data['superadminid'] = superadminid;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}