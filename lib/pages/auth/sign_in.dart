import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/widgets/decoration_functions.dart';
import 'package:sih_student_app/pages/auth/widgets/sign_in_up_bar.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class SignIn extends ConsumerWidget {
  SignIn({
    Key? key,
    required this.onRegisterClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked;
  Color textColor = Colors.white;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isSubmitting = context.isSubmitting();
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 34,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: signInInputDecoration(hintText: 'Email'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: signInInputDecoration(hintText: 'Password'),
                  ),
                ),
                SignInBar(
                  label: 'Sign in',
                  isLoading: true,
                  // isLoading: isSubmitting,
                  onPressed: () async {
                    // context.signInWithEmailAndPassword();
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    try {
                      UserCredential userCred =
                          await ref.read(authInst).signInWithEmailAndPassword(
                        email: email.trim(),
                        password: password,
                      );

                      if (userCred.user != null) {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(
                                builder: (context) {
                                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  //   content: Text("Login Successful"),
                                  //   shape: StadiumBorder(),
                                  //   behavior: SnackBarBehavior.floating,
                                  // ));

                                  return const HomePage();
                                }),
                                (route) => false
                        );
                      }
                    } on FirebaseAuthException catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("error : ${error.message}"),
                        shape: const StadiumBorder(),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  },
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.white,
                    onTap: () async {
                      onRegisterClicked.call();
                    },
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
