// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sih_student_app/common_widgets/alert_dialog.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/pages/splash_screen.dart';
import 'package:sih_student_app/services/Profile/user_model.dart';
import 'package:sih_student_app/services/providers.dart';

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier(UserModel state) : super(state);

  signIn(String email, String password, WidgetRef ref,
      BuildContext context) async {
    try {
      alertDialog(context,
          asset: 'assets/lottie/loadingLottie.json', autoDispose: false);
      UserCredential userCred =
          await ref.read(authInst).signInWithEmailAndPassword(
                email: email.trim(),
                password: password,
              );

      if (userCred.user != null) {
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) {
          return const HomePage();
        }), (route) => false);
        await getUserData(userCred.user!.uid, context);
      }
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      alertDialog(context,
          msg: "${error.message}",
          asset: 'assets/lottie/empty.json',
          autoDispose: false);
    }
  }

  logout(BuildContext context, WidgetRef ref){
    ref.watch(authInst).signOut();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) {
          return const SplashScreen();
        }), (route) => false);
  }

  getUserData(String uuid, BuildContext context) async {
    var url = Uri.parse(
        "https://upastithiapi.herokuapp.com/viewStudentByUUID?studentUUID=$uuid");
    var response = await http.get(url);

    print('UserData: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('getuserdata');
      print(response.body);
      Map<String, dynamic> responseJson = json.decode(response.body);

      state = UserModel.fromRawJson(response.body);
      state = state.copyWith();
    }
    else{
      Map<String, dynamic> responseJson = json.decode(response.body);
      alertDialog(context,
          msg: responseJson['message'],
          asset: 'assets/lottie/empty.json',
          autoDispose: false);
    }
    print(state.studentName);
  }

  changePassword(String newPassword) async {
    var url = Uri.https("upastithiapi.herokuapp.com", "resetPassword");
    var response = await http.post(url,
        body: {"userUUID": state.studentUuid, "newPassword": newPassword});
  }

  resetPassword(String email, VoidCallback onSignInPressed, WidgetRef ref,
      BuildContext context) async {
    try {
      alertDialog(context,
          asset: 'assets/lottie/loadingLottie.json', autoDispose: false);
      await ref.read(authInst).sendPasswordResetEmail(
            email: email.trim(),
          );
      Navigator.pop(context);
      alertDialog(context,
          msg:
              "Reset Link sent to mail. Check your email to reset the password",
          asset: 'assets/lottie/reset_pass.json',
          autoDispose: false);
      onSignInPressed.call();
    } on FirebaseAuthException catch (error) {
      Navigator.pop(context);
      alertDialog(context,
          msg: "${error.message}",
          asset: 'assets/lottie/empty.json',
          autoDispose: false);
    }
  }
}
