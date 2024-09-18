class ReportedResident {
  int? id;
  String? firstname;
  String? lastname;
  String? cnic;
  String? address;
  String? mobileno;
  int? roleid;
  String? rolename;
  String? image;

  int? userid;
  int? subadminid;
  String? title;
  String? description;
  String? date;
  int? status;
  String? statusdescription;
  ReportedResident(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.cnic,
      required this.address,
      required this.mobileno,
      required this.roleid,
      required this.rolename,
      required this.image,
      required this.userid,
      required this.subadminid,
      required this.title,
      required this.description,
      required this.date,
      required this.status,
      required this.statusdescription});
}
