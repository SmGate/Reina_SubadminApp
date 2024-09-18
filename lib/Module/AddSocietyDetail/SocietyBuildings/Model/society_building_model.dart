class SocietyBuilding {
  SocietyBuilding({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  SocietyBuilding.fromJson(Map<String, dynamic> json){
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
    required this.subadminid,
    required this.superadminid,
    required this.societyid,
    required this.societybuildingname,
    required this.dynamicid,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final int subadminid;
  late final int superadminid;
  late final int societyid;
  late final String societybuildingname;
  late final int dynamicid;
  late final String createdAt;
  late final String updatedAt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subadminid = json['subadminid'];
    superadminid = json['superadminid'];
    societyid = json['societyid'];
    societybuildingname = json['societybuildingname'];
    dynamicid = json['dynamicid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subadminid'] = subadminid;
    _data['superadminid'] = superadminid;
    _data['societyid'] = societyid;
    _data['societybuildingname'] = societybuildingname;
    _data['dynamicid'] = dynamicid;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}