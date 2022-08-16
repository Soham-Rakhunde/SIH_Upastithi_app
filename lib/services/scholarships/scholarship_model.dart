// To parse this JSON data, do
//
//     final scholarshipModel = scholarshipModelFromJson(jsonString);

import 'dart:convert';

import 'package:sih_student_app/services/Profile/user_model.dart';
// To parse this JSON data, do
//
//     final scholarshipModel = scholarshipModelFromJson(jsonString);

import 'dart:convert';

class ScholarshipModel {
  ScholarshipModel({
    this.scholarshipEndDate,
    this.scholarshipImage,
    this.scholarshipStartDate,
    this.scholarshipDescription,
    this.scholarshipLink,
    this.isDeleted,
    this.isActive,
    this.scholarshipId,
    this.createdTime,
    this.scholarshipEligibility,
    this.updatedTime,
    this.scholarshipName,
    this.updatedBy,
    this.createdBy,
  });

  final CreatedTime? scholarshipEndDate;
  final String? scholarshipImage;
  final CreatedTime? scholarshipStartDate;
  final String? scholarshipDescription;
  final String? scholarshipLink;
  final bool? isDeleted;
  final bool? isActive;
  final String? scholarshipId;
  final CreatedTime? createdTime;
  final ScholarshipEligibility? scholarshipEligibility;
  final String? updatedTime;
  final String? scholarshipName;
  final String? updatedBy;
  final String? createdBy;

  ScholarshipModel copyWith({
    CreatedTime? scholarshipEndDate,
    String? scholarshipImage,
    CreatedTime? scholarshipStartDate,
    String? scholarshipDescription,
    String? scholarshipLink,
    bool? isDeleted,
    bool? isActive,
    String? scholarshipId,
    CreatedTime? createdTime,
    ScholarshipEligibility? scholarshipEligibility,
    String? updatedTime,
    String? scholarshipName,
    String? updatedBy,
    String? createdBy,
  }) =>
      ScholarshipModel(
        scholarshipEndDate: scholarshipEndDate ?? this.scholarshipEndDate,
        scholarshipImage: scholarshipImage ?? this.scholarshipImage,
        scholarshipStartDate: scholarshipStartDate ?? this.scholarshipStartDate,
        scholarshipDescription: scholarshipDescription ?? this.scholarshipDescription,
        scholarshipLink: scholarshipLink ?? this.scholarshipLink,
        isDeleted: isDeleted ?? this.isDeleted,
        isActive: isActive ?? this.isActive,
        scholarshipId: scholarshipId ?? this.scholarshipId,
        createdTime: createdTime ?? this.createdTime,
        scholarshipEligibility: scholarshipEligibility ?? this.scholarshipEligibility,
        updatedTime: updatedTime ?? this.updatedTime,
        scholarshipName: scholarshipName ?? this.scholarshipName,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
      );

  factory ScholarshipModel.fromRawJson(String str) => ScholarshipModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScholarshipModel.fromJson(Map<String, dynamic> json) => ScholarshipModel(
    scholarshipEndDate: CreatedTime.fromJson(json["scholarshipEndDate"]),
    scholarshipImage: json["scholarshipImage"],
    scholarshipStartDate: CreatedTime.fromJson(json["scholarshipStartDate"]),
    scholarshipDescription: json["scholarshipDescription"],
    scholarshipLink: json["scholarshipLink"],
    isDeleted: json["isDeleted"],
    isActive: json["isActive"],
    scholarshipId: json["scholarshipID"],
    createdTime: CreatedTime.fromJson(json["createdTime"]),
    scholarshipEligibility: ScholarshipEligibility.fromJson(json["scholarshipEligibility"]),
    updatedTime: json["updatedTime"],
    scholarshipName: json["scholarshipName"],
    updatedBy: json["updatedBy"],
    createdBy: json["createdBy"],
  );

  Map<String, dynamic> toJson() => {
    "scholarshipEndDate": scholarshipEndDate?.toJson(),
    "scholarshipImage": scholarshipImage,
    "scholarshipStartDate": scholarshipStartDate?.toJson(),
    "scholarshipDescription": scholarshipDescription,
    "scholarshipLink": scholarshipLink,
    "isDeleted": isDeleted,
    "isActive": isActive,
    "scholarshipID": scholarshipId,
    "createdTime": createdTime?.toJson(),
    "scholarshipEligibility": scholarshipEligibility?.toJson(),
    "updatedTime": updatedTime,
    "scholarshipName": scholarshipName,
    "updatedBy": updatedBy,
    "createdBy": createdBy,
  };
}

class ScholarshipEligibility {
  ScholarshipEligibility({
    this.religion,
    this.attendanceAbove,
    this.caste,
    this.academicScoreAbove,
  });

  final String? religion;
  final String? attendanceAbove;
  final String? caste;
  final String? academicScoreAbove;

  ScholarshipEligibility copyWith({
    String? religion,
    String? attendanceAbove,
    String? caste,
    String? academicScoreAbove,
  }) =>
      ScholarshipEligibility(
        religion: religion ?? this.religion,
        attendanceAbove: attendanceAbove ?? this.attendanceAbove,
        caste: caste ?? this.caste,
        academicScoreAbove: academicScoreAbove ?? this.academicScoreAbove,
      );

  factory ScholarshipEligibility.fromRawJson(String str) => ScholarshipEligibility.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ScholarshipEligibility.fromJson(Map<String, dynamic> json) => ScholarshipEligibility(
    religion: json["religion"],
    attendanceAbove: json["attendanceAbove"],
    caste: json["caste"],
    academicScoreAbove: json["academicScoreAbove"],
  );

  Map<String, dynamic> toJson() => {
    "religion": religion,
    "attendanceAbove": attendanceAbove,
    "caste": caste,
    "academicScoreAbove": academicScoreAbove,
  };
}
