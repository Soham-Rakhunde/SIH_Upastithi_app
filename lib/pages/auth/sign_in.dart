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
    required this.onForgotClicked,
  }) : super(key: key);

  final VoidCallback onRegisterClicked, onForgotClicked;
  Color textColor = Colors.white;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    // final isSubmitting = context.isSubmitting();
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(32.0, 32, 32, 0),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2,),
          Expanded(
            flex: 9,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TextFormField(
                      controller: _emailController,
                      decoration: signInInputDecoration(hintText: 'Email'),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                      controller: _passwordController,
                      decoration: signInInputDecoration(hintText: 'Password'),
                      obscureText: true,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                ),
                SignInBar(
                  label: 'Sign in',
                  isLoading: false,
                  // isLoading: isSubmitting,
                  onPressed: () async {
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
                            MaterialPageRoute(builder: (context) {
                          return const HomePage();
                        }), (route) => false);
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
                Padding(
                  padding: EdgeInsets.only(right: size.width*0.48, top: 10),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        onForgotClicked.call();
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                )
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
                  splashColor: Colors.transparent,
                  onTap: () async {
                    onRegisterClicked.call();
                  },
                  child: Text(
                    "Don't have an Account? Sign up.",
                    style: TextStyle(
                      // decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w800,
                      color: Palette.darkBlue.withOpacity(0.8),
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
