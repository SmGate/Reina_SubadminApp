// To parse this JSON data, do
//
//     final assignParkingModel = assignParkingModelFromJson(jsonString);

import 'dart:convert';

AssignParkingModel assignParkingModelFromJson(String str) =>
    AssignParkingModel.fromJson(json.decode(str));

String assignParkingModelToJson(AssignParkingModel data) =>
    json.encode(data.toJson());

class AssignParkingModel {
  String? message;
  bool? success;
  Data? data;

  AssignParkingModel({
    this.message,
    this.success,
    this.data,
  });

  factory AssignParkingModel.fromJson(Map<String, dynamic> json) =>
      AssignParkingModel(
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
  int? id;
  int? parkingLotId;
  String? slotNumber;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.parkingLotId,
    this.slotNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        parkingLotId: json["parking_lot_id"],
        slotNumber: json["slot_number"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parking_lot_id": parkingLotId,
        "slot_number": slotNumber,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
