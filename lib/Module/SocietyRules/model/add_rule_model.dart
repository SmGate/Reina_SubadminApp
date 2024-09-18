// To parse this JSON data, do
//
//     final addSocietyRuleModel = addSocietyRuleModelFromJson(jsonString);

import 'dart:convert';

AddSocietyRuleModel addSocietyRuleModelFromJson(String str) =>
    AddSocietyRuleModel.fromJson(json.decode(str));

String addSocietyRuleModelToJson(AddSocietyRuleModel data) =>
    json.encode(data.toJson());

class AddSocietyRuleModel {
  String? message;
  bool? success;
  List<Datum>? data;

  AddSocietyRuleModel({
    this.message,
    this.success,
    this.data,
  });

  factory AddSocietyRuleModel.fromJson(Map<String, dynamic> json) =>
      AddSocietyRuleModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? societyId;
  String? title;
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.societyId,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        societyId: json["society_id"],
        title: json["title"],
        description: json["description"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "society_id": societyId,
        "title": title,
        "description": description,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
