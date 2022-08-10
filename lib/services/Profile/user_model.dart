import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jiffy/jiffy.dart';

class UserModel {
  UserModel({
     this.studentEmail,
     this.studentClassId,
     this.studentBmacAddress,
     this.studentGender,
     this.studentAddress,
     this.studentId,
     this.studentEnrollmentId,
     this.studentInstituteId,
     this.updatedTime,
     this.isActive,
     this.createdBy,
     this.createdTime,
     this.studentAttendance,
     this.studentName,
     this.isDeleted,
     this.studentPhoneNumber,
     this.studentRollNumber,
     this.studentScholarshipEligibile,
     this.studentProfileImage,
     this.studentDob,
     this.updatedBy,
     this.studentUuid,
  });

  final String? studentEmail;
  final String? studentClassId;
  final String? studentBmacAddress;
  final String? studentGender;
  final StudentAddress? studentAddress;
  final String? studentId;
  final String? studentEnrollmentId;
  final String? studentInstituteId;
  final String? updatedTime;
  final bool? isActive;
  final String? createdBy;
  final CreatedTime? createdTime;
  final StudentAttendance? studentAttendance;
  final StudentName? studentName;
  final bool? isDeleted;
  final int? studentPhoneNumber;
  final String? studentRollNumber;
  final bool? studentScholarshipEligibile;
  final String? studentProfileImage;
  final CreatedTime? studentDob;
  final String? updatedBy;
  final String? studentUuid;

  UserModel copyWith({
    String? studentEmail,
    String? studentClassId,
    String? studentBmacAddress,
    String? studentGender,
    StudentAddress? studentAddress,
    String? studentId,
    String? studentEnrollmentId,
    String? studentInstituteId,
    String? updatedTime,
    bool? isActive,
    String? createdBy,
    CreatedTime? createdTime,
    StudentAttendance? studentAttendance,
    StudentName? studentName,
    bool? isDeleted,
    int? studentPhoneNumber,
    String? studentRollNumber,
    bool? studentScholarshipEligibile,
    String? studentProfileImage,
    CreatedTime? studentDob,
    String? updatedBy,
    String? studentUuid,
  }) =>
      UserModel(
        studentEmail: studentEmail ?? this.studentEmail,
        studentClassId: studentClassId ?? this.studentClassId,
        studentBmacAddress: studentBmacAddress ?? this.studentBmacAddress,
        studentGender: studentGender ?? this.studentGender,
        studentAddress: studentAddress ?? this.studentAddress,
        studentId: studentId ?? this.studentId,
        studentEnrollmentId: studentEnrollmentId ?? this.studentEnrollmentId,
        studentInstituteId: studentInstituteId ?? this.studentInstituteId,
        updatedTime: updatedTime ?? this.updatedTime,
        isActive: isActive ?? this.isActive,
        createdBy: createdBy ?? this.createdBy,
        createdTime: createdTime ?? this.createdTime,
        studentAttendance: studentAttendance ?? this.studentAttendance,
        studentName: studentName ?? this.studentName,
        isDeleted: isDeleted ?? this.isDeleted,
        studentPhoneNumber: studentPhoneNumber ?? this.studentPhoneNumber,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        studentScholarshipEligibile:
            studentScholarshipEligibile ?? this.studentScholarshipEligibile,
        studentProfileImage: studentProfileImage ?? this.studentProfileImage,
        studentDob: studentDob ?? this.studentDob,
        updatedBy: updatedBy ?? this.updatedBy,
        studentUuid: studentUuid ?? this.studentUuid,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        studentEmail: json["studentEmail"],
        studentClassId: json["studentClassID"],
        studentBmacAddress: json["studentBMACAddress"],
        studentGender: json["studentGender"],
        studentAddress: StudentAddress.fromJson(json["studentAddress"]),
        studentId: json["studentID"],
        studentEnrollmentId: json["studentEnrollmentID"],
        studentInstituteId: json["studentInstituteID"],
        updatedTime: json["updatedTime"],
        isActive: json["isActive"],
        createdBy: json["createdBy"],
        createdTime: CreatedTime.fromJson(json["createdTime"]),
        studentAttendance:
            StudentAttendance.fromJson(json["studentAttendance"]),
        studentName: StudentName.fromJson(json["studentName"]),
        isDeleted: json["isDeleted"],
        studentPhoneNumber: json["studentPhoneNumber"],
        studentRollNumber: json["studentRollNumber"],
        studentScholarshipEligibile: json["studentScholarshipEligibile"],
        studentProfileImage: json["studentProfileImage"],
        studentDob: CreatedTime.fromJson(json["studentDOB"]),
        updatedBy: json["updatedBy"],
        studentUuid: json["studentUUID"],
      );

  Map<String, dynamic> toJson() => {
        "studentEmail": studentEmail,
        "studentClassID": studentClassId,
        "studentBMACAddress": studentBmacAddress,
        "studentGender": studentGender,
        "studentAddress": studentAddress?.toJson(),
        "studentID": studentId,
        "studentEnrollmentID": studentEnrollmentId,
        "studentInstituteID": studentInstituteId,
        "updatedTime": updatedTime,
        "isActive": isActive,
        "createdBy": createdBy,
        "createdTime": createdTime?.toJson(),
        "studentAttendance": studentAttendance?.toJson(),
        "studentName": studentName?.toJson(),
        "isDeleted": isDeleted,
        "studentPhoneNumber": studentPhoneNumber,
        "studentRollNumber": studentRollNumber,
        "studentScholarshipEligibile": studentScholarshipEligibile,
        "studentProfileImage": studentProfileImage,
        "studentDOB": studentDob?.toJson(),
        "updatedBy": updatedBy,
        "studentUUID": studentUuid,
      };
}

class CreatedTime {
  CreatedTime({
     this.seconds,
     this.nanoseconds,
  });

  final int? seconds;
  final int? nanoseconds;


  @override
  String toString() {
    final time = Jiffy.unixFromSecondsSinceEpoch(seconds??0);
    return "${time.date} ${time.MMM} ${time.year}";
  }

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

class StudentAddress {
  StudentAddress({
     this.address,
     this.district,
     this.state,
     this.country,
     this.pinCode,
     this.taluka,
     this.city,
  });

  final String? address;
  final String? district;
  final String? state;
  final String? country;
  final int? pinCode;
  final String? taluka;
  final String? city;


  @override
  String toString() {
    return "$address, $taluka, $city, $district, $state - $pinCode ";
  }

  StudentAddress copyWith({
    String? address,
    String? district,
    String? state,
    String? country,
    int? pinCode,
    String? taluka,
    String? city,
  }) =>
      StudentAddress(
        address: address ?? this.address,
        district: district ?? this.district,
        state: state ?? this.state,
        country: country ?? this.country,
        pinCode: pinCode ?? this.pinCode,
        taluka: taluka ?? this.taluka,
        city: city ?? this.city,
      );

  factory StudentAddress.fromRawJson(String str) =>
      StudentAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentAddress.fromJson(Map<String, dynamic> json) => StudentAddress(
        address: json["Address"],
        district: json["District"],
        state: json["State"],
        country: json["Country"],
        pinCode: json["PinCode"],
        taluka: json["Taluka"],
        city: json["City"],
      );

  Map<String, dynamic> toJson() => {
        "Address": address,
        "District": district,
        "State": state,
        "Country": country,
        "PinCode": pinCode,
        "Taluka": taluka,
        "City": city,
      };
}

class StudentAttendance {
  StudentAttendance({
     this.a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
  });

  final Map<String, Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>?
      a524C0D0Eeea11Ec8Fc60D67304724A81655545210205;

  StudentAttendance copyWith({
    Map<String, Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>?
        a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
  }) =>
      StudentAttendance(
        a524C0D0Eeea11Ec8Fc60D67304724A81655545210205:
            a524C0D0Eeea11Ec8Fc60D67304724A81655545210205 ??
                this.a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
      );

  factory StudentAttendance.fromRawJson(String str) =>
      StudentAttendance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentAttendance.fromJson(Map<String, dynamic> json) =>
      StudentAttendance(
        a524C0D0Eeea11Ec8Fc60D67304724A81655545210205: Map.from(
                json["a524c0d0eeea11ec8fc60d67304724a81655545210205"])
            .map((k, v) => MapEntry<String,
                    Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>(
                k,
                Map.from(v).map((k, v) =>
                    MapEntry<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>(
                        k, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205.fromJson(v))))),
      );

  Map<String, dynamic> toJson() => {
        "a524c0d0eeea11ec8fc60d67304724a81655545210205":
            Map.from(a524C0D0Eeea11Ec8Fc60D67304724A81655545210205!).map(
                (k, v) => MapEntry<String, dynamic>(
                    k,
                    Map.from(v).map(
                        (k, v) => MapEntry<String, dynamic>(k, v.toJson())))),
      };
}

class A524C0D0Eeea11Ec8Fc60D67304724A81655545210205 {
  A524C0D0Eeea11Ec8Fc60D67304724A81655545210205({
     this.attendance,
     this.timestamp,
  });

  final bool? attendance;
  final CreatedTime? timestamp;

  A524C0D0Eeea11Ec8Fc60D67304724A81655545210205 copyWith({
    bool? attendance,
    CreatedTime? timestamp,
  }) =>
      A524C0D0Eeea11Ec8Fc60D67304724A81655545210205(
        attendance: attendance ?? this.attendance,
        timestamp: timestamp ?? this.timestamp,
      );

  factory A524C0D0Eeea11Ec8Fc60D67304724A81655545210205.fromRawJson(
          String str) =>
      A524C0D0Eeea11Ec8Fc60D67304724A81655545210205.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory A524C0D0Eeea11Ec8Fc60D67304724A81655545210205.fromJson(
          Map<String, dynamic> json) =>
      A524C0D0Eeea11Ec8Fc60D67304724A81655545210205(
        attendance: json["attendance"],
        timestamp: CreatedTime.fromJson(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "attendance": attendance,
        "timestamp": timestamp?.toJson(),
      };
}

class StudentName {
  StudentName({
     this.studentLastName,
     this.studentFirstName,
     this.studentMiddleName,
  });

  @override
  String toString() {
    return "$studentFirstName $studentLastName";
  }

  final String? studentLastName;
  final String? studentFirstName;
  final String? studentMiddleName;

  StudentName copyWith({
    String? studentLastName,
    String? studentFirstName,
    String? studentMiddleName,
  }) =>
      StudentName(
        studentLastName: studentLastName ?? this.studentLastName,
        studentFirstName: studentFirstName ?? this.studentFirstName,
        studentMiddleName: studentMiddleName ?? this.studentMiddleName,
      );

  factory StudentName.fromRawJson(String str) =>
      StudentName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentName.fromJson(Map<String, dynamic> json) => StudentName(
        studentLastName: json["studentLastName"],
        studentFirstName: json["studentFirstName"],
        studentMiddleName: json["studentMiddleName"],
      );

  Map<String, dynamic> toJson() => {
        "studentLastName": studentLastName,
        "studentFirstName": studentFirstName,
        "studentMiddleName": studentMiddleName,
      };
}
