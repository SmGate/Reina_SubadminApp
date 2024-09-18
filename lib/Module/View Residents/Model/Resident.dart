class Resident {
  final int? id;
  final int? subadminid;
  final int? residentid;
  final int? committeemember;
  final int? roleid;
  final String? vechileno;
  final String? residenttype;
  final String? propertytype;
  final String? created_at;
  final String? updated_at;
  final String? firstname;
  final String? lastname;
  final String? cnic;
  final String? address;
  final String? mobileno;
  final String? password;
  final String? rolename;
  final String? image;
  final String? ownername;
  final String? owneraddress;
  final String? ownermobileno;

  Resident(
      {required this.id,
      required this.subadminid,
      required this.residentid,
      required this.committeemember,
      required this.roleid,
      required this.vechileno,
      required this.residenttype,
      required this.propertytype,
      required this.created_at,
      required this.updated_at,
      required this.firstname,
      required this.lastname,
      required this.cnic,
      required this.address,
      required this.mobileno,
      required this.password,
      required this.rolename,
      required this.image,
      required this.ownername,
      required this.owneraddress,
      required this.ownermobileno});
}
