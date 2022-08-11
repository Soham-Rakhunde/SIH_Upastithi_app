import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_student_app/services/Profile/user_model.dart';
import 'package:sih_student_app/services/Profile/user_notifier.dart';
import 'package:sih_student_app/services/qr/qrModel.dart';
import 'package:sih_student_app/services/qr/qr_notifier.dart';
import 'package:sih_student_app/services/scholarships/scholarship_model.dart';
import 'package:sih_student_app/services/scholarships/scholarship_notifier.dart';

//Firebase Instances
final authInst = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
// final storageInst = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

//Firestore Collections
// final usersCollection = Provider<CollectionReference>((ref) => ref.watch(firestoreInst).collection("UserData"));

enum authPages { sign_in, reset_password }

final authPageController = StateProvider<authPages>((ref) => authPages.sign_in);

final userController = StateNotifierProvider<UserNotifier, UserModel>((ref) {
  return UserNotifier(UserModel());
});

final qrController = StateNotifierProvider<QrNotifier, QrModel>((ref) {
  return QrNotifier(QrModel());
});


final scholarshipController = StateNotifierProvider<ScholarshipNotifier, ScholarshipModel>((ref) {
  return ScholarshipNotifier(ScholarshipModel());
});


enum homeTabs { dashboard, scholarship, qr, profile }
final homeTabController = StateProvider<homeTabs>((ref) => homeTabs.dashboard);