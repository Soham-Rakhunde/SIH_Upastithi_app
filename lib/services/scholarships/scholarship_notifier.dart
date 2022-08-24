import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';


final scholarshipsProvider = FutureProvider<List<ScholarshipModel>>((ref) async {
  // alertDialog(context,
  //     asset: 'assets/lottie/qr_loading.json', autoDispose: false);
  var url =
  Uri.https("upastithiapi.herokuapp.com", "viewScholarships");

  var response = await http.get(url);
  print(response.statusCode);
  // Navigator.pop(context);
  if (response.statusCode == 200) {
    return (json.decode(response.body) as List).map((i) =>
        ScholarshipModel.fromJson(i)).toList();
  } else {
    Map<String, dynamic> responseJson = json.decode(response.body);
    // alertDialog(context,
    //     msg: responseJson['message'],
    //     asset: 'assets/lottie/empty.json',
    //     autoDispose: false);
  }
  return [];
});

// class ScholarshipNotifier extends StateNotifier<Scholarships> {
//   ScholarshipNotifier(Scholarships state) : super(state);
//
//
//
//
//   Future<List<ScholarshipModel>> getScholarships(BuildContext context, WidgetRef ref) async {
//     // final studentId = ref.watch(scholarshipController.notifier).state.studentId;
//
//     alertDialog(context,
//         asset: 'assets/lottie/qr_loading.json', autoDispose: false);
//     var url =
//     Uri.https("upastithiapi.herokuapp.com", "viewScholarships");
//
//     var response = await http.get(url);
//     print(response.statusCode);
//     Navigator.pop(context);
//     if (response.statusCode == 200) {
//
//       state = state.copyWith(list: Scholarships.fromRawJson(response.body).list);
//       print("list len ${state.list!.length}");
//     } else {
//       Map<String, dynamic> responseJson = json.decode(response.body);
//       alertDialog(context,
//           msg: responseJson['message'],
//           asset: 'assets/lottie/empty.json',
//           autoDispose: false);
//     }
//     return [];
//   }
// }
