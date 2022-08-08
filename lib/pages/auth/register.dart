import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/widgets/decoration_functions.dart';
import 'package:sih_student_app/pages/auth/widgets/sign_in_up_bar.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class Register extends ConsumerWidget {
  Register({Key? key, required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isSubmitting = context.isSubmitting();
    final size = MediaQuery.of(context).size;
    return  Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 32, 32, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 6,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create\nAccount',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
            ),
          ),
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
                      decoration: registerInputDecoration(hintText: 'Email')),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                        color: Palette.darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w700
                    ),
                    decoration: registerInputDecoration(hintText: 'Password'),
                  ),
                ),
                SignUpBar(
                  label: 'Sign up',
                  isLoading: true,
                  // isLoading: isSubmitting,
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    try {
                      UserCredential userCred =
                          await ref.read(authInst).createUserWithEmailAndPassword(
                        email: email.trim(),
                        password: password,
                      );

                      if (userCred.user != null) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(
                                builder: (context) {
                                  return const HomePage();
                                }),
                                (route) => false
                        );
                      }
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
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () async {
                    onSignInPressed.call();
                  },
                  child: Text(
                    "Already have an Account? Log in.",
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
    );
  }
}