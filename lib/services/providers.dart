import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sih_student_app/pages/auth/AuthModel.dart';
import 'package:sih_student_app/services/state_notifiers/auth_notifier.dart';

//Firebase Instances
final authInst = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
// final storageInst = Provider<FirebaseStorage>((ref) => FirebaseStorage.instance);

//Firestore Collections
// final usersCollection = Provider<CollectionReference>((ref) => ref.watch(firestoreInst).collection("UserData"));

enum authPages { sign_in, reset_password }

final authPageController = StateProvider<authPages>((ref) => authPages.sign_in);

final authController = StateNotifierProvider<AuthNotifier, AuthModel>((ref) {
  return AuthNotifier(const AuthModel());
});
