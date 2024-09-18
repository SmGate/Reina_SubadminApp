class ResidentReports {
  int? id;
  
  int? userid;
  int? subadminid;
  String? title;
  String? description;
  String? date;
  int? status;
  String? statusdescription;
  String? updatedAt;
  ResidentReports(
      {
        required this.id,
      
      required this.userid,
      required this.subadminid,
      required this.title,
      required this.description,
      required this.date,
      required this.status,
        required this.updatedAt,
      required this.statusdescription});
}
