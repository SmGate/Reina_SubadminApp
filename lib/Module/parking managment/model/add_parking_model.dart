// To parse this JSON data, do
//
//     final addParkingModel = addParkingModelFromJson(jsonString);

import 'dart:convert';

AddParkingModel addParkingModelFromJson(String str) =>
    AddParkingModel.fromJson(json.decode(str));

String addParkingModelToJson(AddParkingModel data) =>
    json.encode(data.toJson());

class AddParkingModel {
  String? message;
  bool? success;
  Data? data;

  AddParkingModel({
    this.message,
    this.success,
    this.data,
  });

  factory AddParkingModel.fromJson(Map<String, dynamic> json) =>
      AddParkingModel(
        message: json["message"],
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  String? societyId;
  String? name;
  String? totalSlots;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.societyId,
    this.name,
    this.totalSlots,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        societyId: json["society_id"],
        name: json["name"],
        totalSlots: json["total_slots"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "society_id": societyId,
        "name": name,
        "total_slots": totalSlots,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
