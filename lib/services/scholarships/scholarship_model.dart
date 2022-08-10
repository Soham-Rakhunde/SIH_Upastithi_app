// To parse this JSON data, do
//
//     final scholarshipModel = scholarshipModelFromJson(jsonString);

import 'dart:convert';

class ScholarshipModel {
  ScholarshipModel({
    this.createdTime,
    this.isActive,
    this.updatedBy,
    this.scholarshipDescription,
    this.scholarshipEligibility,
    this.scholarshipEndDate,
    this.scholarshipName,
    this.createdBy,
    this.isDeleted,
    this.scholarshipStartDate,
    this.scholarshipId,
    this.updatedTime,
  });

  final CreatedTime? createdTime;
  final bool? isActive;
  final String? updatedBy;
  final String? scholarshipDescription;
  final ScholarshipEligibility? scholarshipEligibility;
  final CreatedTime? scholarshipEndDate;
  final String? scholarshipName;
  final String? createdBy;
  final bool? isDeleted;
  final CreatedTime? scholarshipStartDate;
  final String? scholarshipId;
  final String? updatedTime;

  ScholarshipModel copyWith({
    CreatedTime? createdTime,
    bool? isActive,
    String? updatedBy,
    String? scholarshipDescription,
    ScholarshipEligibility? scholarshipEligibility,
    CreatedTime? scholarshipEndDate,
    String? scholarshipName,
    String? createdBy,
    bool? isDeleted,
    CreatedTime? scholarshipStartDate,
    String? scholarshipId,
    String? updatedTime,
  }) =>
      ScholarshipModel(
        createdTime: createdTime ?? this.createdTime,
        isActive: isActive ?? this.isActive,
        updatedBy: updatedBy ?? this.updatedBy,
        scholarshipDescription:
            scholarshipDescription ?? this.scholarshipDescription,
        scholarshipEligibility:
            scholarshipEligibility ?? this.scholarshipEligibility,
        scholarshipEndDate: scholarshipEndDate ?? this.scholarshipEndDate,
        scholarshipName: scholarshipName ?? this.scholarshipName,
        createdBy: createdBy ?? this.createdBy,
        isDeleted: isDeleted ?? this.isDeleted,
        scholarshipStartDate: scholarshipStartDate ?? this.scholarshipStartDate,
        scholarshipId: scholarshipId ?? this.scholarshipId,
        updatedTime: updatedTime ?? this.updatedTime,
      );

  factory ScholarshipModel.fromRawJson(String str) =>
      ScholarshipModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) =>
      ScholarshipModel(
        createdTime: CreatedTime.fromJson(json["createdTime"]),
        isActive: json["isActive"],
        updatedBy: json["updatedBy"],
        scholarshipDescription: json["scholarshipDescription"],
        scholarshipEligibility:
            ScholarshipEligibility.fromJson(json["scholarshipEligibility"]),
        scholarshipEndDate: CreatedTime.fromJson(json["scholarshipEndDate"]),
        scholarshipName: json["scholarshipName"],
        createdBy: json["createdBy"],
        isDeleted: json["isDeleted"],
        scholarshipStartDate:
            CreatedTime.fromJson(json["scholarshipStartDate"]),
        scholarshipId: json["scholarshipID"],
        updatedTime: json["updatedTime"],
      );

  Map<String, dynamic> toJson() => {
        "createdTime": createdTime?.toJson(),
        "isActive": isActive,
        "updatedBy": updatedBy,
        "scholarshipDescription": scholarshipDescription,
        "scholarshipEligibility": scholarshipEligibility?.toJson(),
        "scholarshipEndDate": scholarshipEndDate?.toJson(),
        "scholarshipName": scholarshipName,
        "createdBy": createdBy,
        "isDeleted": isDeleted,
        "scholarshipStartDate": scholarshipStartDate?.toJson(),
        "scholarshipID": scholarshipId,
        "updatedTime": updatedTime,
      };
}

class CreatedTime {
  CreatedTime({
    this.seconds,
    this.nanoseconds,
  });

  final int? seconds;
  final int? nanoseconds;

  CreatedTime copyWith({
    int? seconds,
    int? nanoseconds,
  }) =>
      CreatedTime(
        seconds: seconds ?? this.seconds,
        nanoseconds: nanoseconds ?? this.nanoseconds,
      );

  factory CreatedTime.fromRawJson(String str) =>
      CreatedTime.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CreatedTime.fromJson(Map<String, dynamic> json) => CreatedTime(
        seconds: json["_seconds"],
        nanoseconds: json["_nanoseconds"],
      );

  Map<String, dynamic> toJson() => {
        "_seconds": seconds,
        "_nanoseconds": nanoseconds,
      };
}

class ScholarshipEligibility {
  ScholarshipEligibility({
    this.religion,
    this.attendanceAbove,
    this.academicScoreAbove,
    this.caste,
  });

  final String? religion;
  final String? attendanceAbove;
  final String? academicScoreAbove;
  final String? caste;

  ScholarshipEligibility copyWith({
    String? religion,
    String? attendanceAbove,
    String? academicScoreAbove,
    String? caste,
  }) =>
      ScholarshipEligibility(
        religion: religion ?? this.religion,
        attendanceAbove: attendanceAbove ?? this.attendanceAbove,
        academicScoreAbove: academicScoreAbove ?? this.academicScoreAbove,
        caste: caste ?? this.caste,
      );

  factory ScholarshipEligibility.fromRawJson(String str) =>
      ScholarshipEligibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScholarshipEligibility.fromJson(Map<String, dynamic> json) =>
      ScholarshipEligibility(
        religion: json["religion"],
        attendanceAbove: json["attendanceAbove"],
        academicScoreAbove: json["academicScoreAbove"],
        caste: json["caste"],
      );

  Map<String, dynamic> toJson() => {
        "religion": religion,
        "attendanceAbove": attendanceAbove,
        "academicScoreAbove": academicScoreAbove,
        "caste": caste,
      };
}
