// To parse this JSON data, do
//
//     final teamModel = teamModelFromJson(jsonString);

import 'dart:convert';

import 'package:sih_student_app/services/Profile/user_model.dart';

class TeamModel {
  TeamModel({
    this.teamName,
    this.teamId,
    this.history,
    this.present,
    this.total,
  });

  final String? teamName;
  final String? teamId;
  final Map<String, History>? history;
  final int? present;
  final int? total;

  TeamModel copyWith({
    String? teamName,
    String? teamId,
    Map<String, History>? history,
    int? present,
    int? total,
  }) =>
      TeamModel(
        teamName: teamName ?? this.teamName,
        teamId: teamId ?? this.teamId,
        history: history ?? this.history,
        present: present ?? this.present,
        total: total ?? this.total,
      );

  factory TeamModel.fromRawJson(String str) => TeamModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
    teamName: json["teamName"],
    teamId: json["teamID"],
    history: Map.from(json["history"]).map((k, v) => MapEntry<String, History>(k, History.fromJson(v))),
    present: json["present"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "teamName": teamName,
    "teamID": teamId,
    "history": history == null? null:Map.from(history!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "present": present,
    "total": total,
  };
}

class History {
  History({
    this.timestamp,
    this.attendance,
  });

  final CreatedTime? timestamp;
  final bool? attendance;

  History copyWith({
    CreatedTime? timestamp,
    bool? attendance,
  }) =>
      History(
        timestamp: timestamp ?? this.timestamp,
        attendance: attendance ?? this.attendance,
      );

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory History.fromJson(Map<String, dynamic> json) => History(
    timestamp: CreatedTime.fromJson(json["timestamp"]),
    attendance: json["attendance"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp?.toJson(),
    "attendance": attendance,
  };
}
