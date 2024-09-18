// To parse this JSON data, do
//
//     final getAreaAndSlotsModel = getAreaAndSlotsModelFromJson(jsonString);

import 'dart:convert';

GetAreaAndSlotsModel getAreaAndSlotsModelFromJson(String str) =>
    GetAreaAndSlotsModel.fromJson(json.decode(str));

String getAreaAndSlotsModelToJson(GetAreaAndSlotsModel data) =>
    json.encode(data.toJson());

class GetAreaAndSlotsModel {
  String? message;
  bool? success;
  Data? data;

  GetAreaAndSlotsModel({
    this.message,
    this.success,
    this.data,
  });

  factory GetAreaAndSlotsModel.fromJson(Map<String, dynamic> json) =>
      GetAreaAndSlotsModel(
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
  List<String>? areas;
  List<String>? status;
  Counts? counts;
  List<Slot>? slots;
  List<Resident>? resident;

  Data({
    this.areas,
    this.status,
    this.counts,
    this.slots,
    this.resident,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        areas: json["areas"] == null
            ? []
            : List<String>.from(json["areas"]!.map((x) => x)),
        status: json["status"] == null
            ? []
            : List<String>.from(json["status"]!.map((x) => x)),
        counts: json["counts"] == null ? null : Counts.fromJson(json["counts"]),
        slots: json["slots"] == null
            ? []
            : List<Slot>.from(json["slots"]!.map((x) => Slot.fromJson(x))),
        resident: json["resident"] == null
            ? []
            : List<Resident>.from(
                json["resident"]!.map((x) => Resident.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "areas": areas == null ? [] : List<dynamic>.from(areas!.map((x) => x)),
        "status":
            status == null ? [] : List<dynamic>.from(status!.map((x) => x)),
        "counts": counts?.toJson(),
        "slots": slots == null
            ? []
            : List<dynamic>.from(slots!.map((x) => x.toJson())),
        "resident": resident == null
            ? []
            : List<dynamic>.from(resident!.map((x) => x.toJson())),
      };
}

class Counts {
  int? availableSlots;
  int? occupiedSlots;
  int? unOccupiedSlots;

  Counts({
    this.availableSlots,
    this.occupiedSlots,
    this.unOccupiedSlots,
  });

  factory Counts.fromJson(Map<String, dynamic> json) => Counts(
        availableSlots: json["Available Slots"],
        occupiedSlots: json["Occupied Slots"],
        unOccupiedSlots: json["Un-Occupied Slots"],
      );

  Map<String, dynamic> toJson() => {
        "Available Slots": availableSlots,
        "Occupied Slots": occupiedSlots,
        "Un-Occupied Slots": unOccupiedSlots,
      };
}

class Resident {
  int? residentid;
  String? firstname;
  String? lastname;

  Resident({
    this.residentid,
    this.firstname,
    this.lastname,
  });

  factory Resident.fromJson(Map<String, dynamic> json) => Resident(
        residentid: json["residentid"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "residentid": residentid,
        "firstname": firstname,
        "lastname": lastname,
      };
}

class Slot {
  int? id;
  int? parkingLotId;
  String? slotNumber;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? userName;

  Slot({
    this.id,
    this.parkingLotId,
    this.slotNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userName,
  });

  factory Slot.fromJson(Map<String, dynamic> json) => Slot(
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
        userName: json["user_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parking_lot_id": parkingLotId,
        "slot_number": slotNumber,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_name": userName,
      };
}
