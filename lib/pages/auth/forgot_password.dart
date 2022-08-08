import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/widgets/decoration_functions.dart';
import 'package:sih_student_app/pages/auth/widgets/sign_in_up_bar.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class ForgotPassword extends ConsumerWidget {
  ForgotPassword({Key? key, required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isSubmitting = context.isSubmitting();
    final size = MediaQuery.of(context).size;
    return  WillPopScope(
      onWillPop: () async {
        onSignInPressed.call();
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(32.0, 32, 32, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 8,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Reset\nPassword',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            Spacer(flex:2 ,),
            Expanded(
              flex: 8,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                        controller: _emailController,
                        style: const TextStyle(
                            color: Palette.darkBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                        decoration: registerInputDecoration(hintText: 'Enter Email')),
                  ),
                  SignUpBar(
                    label: 'Send',
                    isLoading: true,
                    // isLoading: isSubmitting,
                    onPressed: () async {
                      final email = _emailController.text;
                      try {
                        await ref.read(authInst).sendPasswordResetEmail(
                          email: email.trim(),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Reset Link sent to mail. Check your email to reset the password"),
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
                    },
                  ),
                ],
              ),
            ),


            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      onSignInPressed.call();
                    },
                    child: Text(
                      "After sending the reset request\nCheck your email for the reset link",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w800,
                        color: Palette.darkBlue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}