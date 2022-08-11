import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';

class ScholarshipNotifier extends StateNotifier<ScholarshipModel> {
  ScholarshipNotifier(ScholarshipModel state) : super(state);
}
