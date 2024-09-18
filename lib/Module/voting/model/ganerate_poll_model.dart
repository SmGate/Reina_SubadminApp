// To parse this JSON data, do
//
//     final generatePollModel = generatePollModelFromJson(jsonString);

import 'dart:convert';

GeneratePollModel generatePollModelFromJson(String str) =>
    GeneratePollModel.fromJson(json.decode(str));

String generatePollModelToJson(GeneratePollModel data) =>
    json.encode(data.toJson());

class GeneratePollModel {
  String? message;
  bool? success;
  Data? data;

  GeneratePollModel({
    this.message,
    this.success,
    this.data,
  });

  factory GeneratePollModel.fromJson(Map<String, dynamic> json) =>
      GeneratePollModel(
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
  int? societyId;
  String? title;
  DateTime? endDate;
  String? endTime;
  int? isResonable;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Option>? options;

  Data({
    this.id,
    this.societyId,
    this.title,
    this.endDate,
    this.endTime,
    this.isResonable,
    this.createdAt,
    this.updatedAt,
    this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        societyId: json["society_id"],
        title: json["title"],
        endDate:
            json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        endTime: json["end_time"],
        isResonable: json["is_resonable"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        options: json["options"] == null
            ? []
            : List<Option>.from(
                json["options"]!.map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "society_id": societyId,
        "title": title,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "end_time": endTime,
        "is_resonable": isResonable,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "options": options == null
            ? []
            : List<dynamic>.from(options!.map((x) => x.toJson())),
      };
}

class Option {
  int? id;
  int? pollId;
  String? optionText;
  DateTime? createdAt;
  DateTime? updatedAt;

  Option({
    this.id,
    this.pollId,
    this.optionText,
    this.createdAt,
    this.updatedAt,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        pollId: json["poll_id"],
        optionText: json["option_text"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "poll_id": pollId,
        "option_text": optionText,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
