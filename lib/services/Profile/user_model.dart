// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:jiffy/jiffy.dart';

class UserModel {
  UserModel({
    this.studentAddress,
    this.isActive,
    this.studentScholarshipEligibile,
    this.studentBmacAddress,
    this.studentProfileImage,
    this.updatedTime,
    this.studentBloodGroup,
    this.studentName,
    this.studentAttendance,
    this.studentUuid,
    this.studentInstituteId,
    this.studentPhoneNumber,
    this.createdTime,
    this.studentDob,
    this.studentEmail,
    this.updatedBy,
    this.createdBy,
    this.studentRollNumber,
    this.isDeleted,
    this.studentGender,
    this.studentClassId,
    this.studentId,
    this.studentEnrollmentId,
  });

  final StudentAddress? studentAddress;
  final bool? isActive;
  final bool? studentScholarshipEligibile;
  final String? studentBmacAddress;
  final String? studentProfileImage;
  final String? updatedTime;
  final String? studentBloodGroup;
  final StudentName? studentName;
  final StudentAttendance? studentAttendance;
  final String? studentUuid;
  final String? studentInstituteId;
  final int? studentPhoneNumber;
  final CreatedTime? createdTime;
  final CreatedTime? studentDob;
  final String? studentEmail;
  final String? updatedBy;
  final String? createdBy;
  final String? studentRollNumber;
  final bool? isDeleted;
  final String? studentGender;
  final String? studentClassId;
  final String? studentId;
  final String? studentEnrollmentId;

  UserModel copyWith({
    StudentAddress? studentAddress,
    bool? isActive,
    bool? studentScholarshipEligibile,
    String? studentBmacAddress,
    String? studentProfileImage,
    String? updatedTime,
    String? studentBloodGroup,
    StudentName? studentName,
    StudentAttendance? studentAttendance,
    String? studentUuid,
    String? studentInstituteId,
    int? studentPhoneNumber,
    CreatedTime? createdTime,
    CreatedTime? studentDob,
    String? studentEmail,
    String? updatedBy,
    String? createdBy,
    String? studentRollNumber,
    bool? isDeleted,
    String? studentGender,
    String? studentClassId,
    String? studentId,
    String? studentEnrollmentId,
  }) =>
      UserModel(
        studentAddress: studentAddress ?? this.studentAddress,
        isActive: isActive ?? this.isActive,
        studentScholarshipEligibile:
            studentScholarshipEligibile ?? this.studentScholarshipEligibile,
        studentBmacAddress: studentBmacAddress ?? this.studentBmacAddress,
        studentProfileImage: studentProfileImage ?? this.studentProfileImage,
        updatedTime: updatedTime ?? this.updatedTime,
        studentBloodGroup: studentBloodGroup ?? this.studentBloodGroup,
        studentName: studentName ?? this.studentName,
        studentAttendance: studentAttendance ?? this.studentAttendance,
        studentUuid: studentUuid ?? this.studentUuid,
        studentInstituteId: studentInstituteId ?? this.studentInstituteId,
        studentPhoneNumber: studentPhoneNumber ?? this.studentPhoneNumber,
        createdTime: createdTime ?? this.createdTime,
        studentDob: studentDob ?? this.studentDob,
        studentEmail: studentEmail ?? this.studentEmail,
        updatedBy: updatedBy ?? this.updatedBy,
        createdBy: createdBy ?? this.createdBy,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        isDeleted: isDeleted ?? this.isDeleted,
        studentGender: studentGender ?? this.studentGender,
        studentClassId: studentClassId ?? this.studentClassId,
        studentId: studentId ?? this.studentId,
        studentEnrollmentId: studentEnrollmentId ?? this.studentEnrollmentId,
      );

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        studentAddress: StudentAddress.fromJson(json["studentAddress"]),
        isActive: json["isActive"],
        studentScholarshipEligibile: json["studentScholarshipEligibile"],
        studentBmacAddress: json["studentBMACAddress"],
        studentProfileImage: json["studentProfileImage"],
        updatedTime: json["updatedTime"],
        studentBloodGroup: json["studentBloodGroup"],
        studentName: StudentName.fromJson(json["studentName"]),
        studentAttendance:
            StudentAttendance.fromJson(json["studentAttendance"]),
        studentUuid: json["studentUUID"],
        studentInstituteId: json["studentInstituteID"],
        studentPhoneNumber: json["studentPhoneNumber"],
        createdTime: CreatedTime.fromJson(json["createdTime"]),
        studentDob: CreatedTime.fromJson(json["studentDOB"]),
        studentEmail: json["studentEmail"],
        updatedBy: json["updatedBy"],
        createdBy: json["createdBy"],
        studentRollNumber: json["studentRollNumber"],
        isDeleted: json["isDeleted"],
        studentGender: json["studentGender"],
        studentClassId: json["studentClassID"],
        studentId: json["studentID"],
        studentEnrollmentId: json["studentEnrollmentID"],
      );

  Map<String, dynamic> toJson() => {
        "studentAddress": studentAddress?.toJson(),
        "isActive": isActive,
        "studentScholarshipEligibile": studentScholarshipEligibile,
        "studentBMACAddress": studentBmacAddress,
        "studentProfileImage": studentProfileImage,
        "updatedTime": updatedTime,
        "studentBloodGroup": studentBloodGroup,
        "studentName": studentName?.toJson(),
        "studentAttendance": studentAttendance?.toJson(),
        "studentUUID": studentUuid,
        "studentInstituteID": studentInstituteId,
        "studentPhoneNumber": studentPhoneNumber,
        "createdTime": createdTime?.toJson(),
        "studentDOB": studentDob?.toJson(),
        "studentEmail": studentEmail,
        "updatedBy": updatedBy,
        "createdBy": createdBy,
        "studentRollNumber": studentRollNumber,
        "isDeleted": isDeleted,
        "studentGender": studentGender,
        "studentClassID": studentClassId,
        "studentID": studentId,
        "studentEnrollmentID": studentEnrollmentId,
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
    this.district,
    this.city,
    this.address,
    this.state,
    this.country,
    this.pinCode,
    this.taluka,
  });

  final String? district;
  final String? city;
  final String? address;
  final String? state;
  final String? country;
  final int? pinCode;
  final String? taluka;

  @override
  String toString() {
    return "$address, $taluka, $city, $district, $state - $pinCode ";
  }

  StudentAddress copyWith({
    String? district,
    String? city,
    String? address,
    String? state,
    String? country,
    int? pinCode,
    String? taluka,
  }) =>
      StudentAddress(
        district: district ?? this.district,
        city: city ?? this.city,
        address: address ?? this.address,
        state: state ?? this.state,
        country: country ?? this.country,
        pinCode: pinCode ?? this.pinCode,
        taluka: taluka ?? this.taluka,
      );

  factory StudentAddress.fromRawJson(String str) =>
      StudentAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentAddress.fromJson(Map<String, dynamic> json) => StudentAddress(
        district: json["District"],
        city: json["City"],
        address: json["Address"],
        state: json["State"],
        country: json["Country"],
        pinCode: json["PinCode"],
        taluka: json["Taluka"],
      );

  Map<String, dynamic> toJson() => {
        "District": district,
        "City": city,
        "Address": address,
        "State": state,
        "Country": country,
        "PinCode": pinCode,
        "Taluka": taluka,
      };
}

// class StudentAttendance {
//   StudentAttendance({
//      this.a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
//   });
//
//   final Map<String, Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>?
//       a524C0D0Eeea11Ec8Fc60D67304724A81655545210205;
//
//   StudentAttendance copyWith({
//     Map<String, Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>?
//         a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
//   }) =>
//       StudentAttendance(
//         a524C0D0Eeea11Ec8Fc60D67304724A81655545210205:
//             a524C0D0Eeea11Ec8Fc60D67304724A81655545210205 ??
//                 this.a524C0D0Eeea11Ec8Fc60D67304724A81655545210205,
//       );
//
//   factory StudentAttendance.fromRawJson(String str) =>
//       StudentAttendance.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory StudentAttendance.fromJson(Map<String, dynamic> json) =>
//       StudentAttendance(
//         a524C0D0Eeea11Ec8Fc60D67304724A81655545210205: Map.from(
//                 json["a524c0d0eeea11ec8fc60d67304724a81655545210205"])
//             .map((k, v) => MapEntry<String,
//                     Map<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>>(
//                 k,
//                 Map.from(v).map((k, v) =>
//                     MapEntry<String, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205>(
//                         k, A524C0D0Eeea11Ec8Fc60D67304724A81655545210205.fromJson(v))))),
//       );
//
// factory StudentAttendance.fromRawJson(String str) => StudentAttendance.fromJson(json.decode(str));
//
// String toRawJson() => json.encode(toJson());
//
// factory StudentAttendance.fromJson(Map<String, dynamic> json) => StudentAttendance(
//     );

// Map<String, dynamic> toJson() => {
// };
// }

class StudentAttendance {
  StudentAttendance();

  StudentAttendance copyWith() => StudentAttendance();

  factory StudentAttendance.fromRawJson(String str) =>
      StudentAttendance.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentAttendance.fromJson(Map<String, dynamic> json) =>
      StudentAttendance();

  Map<String, dynamic> toJson() => {};
}

class StudentName {
  StudentName({
    this.studentMiddleName,
    this.studentLastName,
    this.studentFirstName,
  });

  String shortName(){
    return "$studentFirstName $studentLastName";
  }

  final String? studentMiddleName;
  final String? studentLastName;
  final String? studentFirstName;

  StudentName copyWith({
    String? studentMiddleName,
    String? studentLastName,
    String? studentFirstName,
  }) =>
      StudentName(
        studentMiddleName: studentMiddleName ?? this.studentMiddleName,
        studentLastName: studentLastName ?? this.studentLastName,
        studentFirstName: studentFirstName ?? this.studentFirstName,
      );

  factory StudentName.fromRawJson(String str) =>
      StudentName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StudentName.fromJson(Map<String, dynamic> json) => StudentName(
        studentMiddleName: json["studentMiddleName"],
        studentLastName: json["studentLastName"],
        studentFirstName: json["studentFirstName"],
      );

  Map<String, dynamic> toJson() => {
        "studentMiddleName": studentMiddleName,
        "studentLastName": studentLastName,
        "studentFirstName": studentFirstName,
      };
}
