import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sih_student_app/services/providers.dart';
import 'package:sih_student_app/services/subject_wise/subjectModel.dart';

final subjectsProvider =
FutureProvider<List<TeamModel>>((ref) async {
  // alertDialog(context,
  //     asset: 'assets/lottie/qr_loading.json', autoDispose: false);
  var url = Uri.parse(
      "https://upastithiapi.herokuapp.com/viewStudentAttendanceHistory"
          +"?studentID=${ref.watch(userController).studentId}"
          +"&classID=${ref.watch(userController).studentAttendance?.classList.elementAt(0).classId}");

  var response = await http.get(url);
  print(response.statusCode);
  // Navigator.pop(context);
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List)
        .map((i) => TeamModel.fromJson(i))
        .toList();
  } else {
    Map<String, dynamic> responseJson = json.decode(response.body);
    // alertDialog(context,
    //     msg: responseJson['message'],
    //     asset: 'assets/lottie/empty.json',
    //     autoDispose: false);
  }
  return [];
});
