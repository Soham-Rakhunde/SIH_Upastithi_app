import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:sih_student_app/pages/auth/AuthModel.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/services/providers.dart';

class AuthNotifier extends StateNotifier<AuthModel> {
  AuthNotifier(AuthModel state) : super(state);

  signIn(String email, String password, WidgetRef ref,
      BuildContext context) async {
    try {
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
        state = state.copyWith(
          id: userCred.user?.uid,
          email: userCred.user?.email,
          name: userCred.user?.displayName,
        );
      }
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: ${error.message}"),
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  resetPassword(String newPassword) async {
    var url = Uri.https("upastithiapi.herokuapp.com", "resetPassword");
    var response = await http
        .post(url, body: {"userUUID": state.id, "newPassword": newPassword});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  changePassword(String email, VoidCallback onSignInPressed, WidgetRef ref,
      BuildContext context) async {
    try {
      await ref.read(authInst).sendPasswordResetEmail(
            email: email.trim(),
          );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Reset Link sent to mail. Check your email to reset the password"),
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      onSignInPressed.call();
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error: ${error.message}"),
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
