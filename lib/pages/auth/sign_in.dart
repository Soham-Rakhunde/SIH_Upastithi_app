import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/widgets/decoration_functions.dart';
import 'package:sih_student_app/pages/auth/widgets/sign_in_up_bar.dart';
import 'package:sih_student_app/services/providers.dart';

class SignIn extends ConsumerStatefulWidget {
  SignIn({
    Key? key,
    required this.onForgotClicked,
  }) : super(key: key);

  final VoidCallback onForgotClicked;

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  Color textColor = Colors.white;
  late TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          const Spacer(
            flex: 2,
          ),
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
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text;
                    ref
                        .watch(authController.notifier)
                        .signIn(email, password, ref, context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.4, top: 10),
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () async {
                        widget.onForgotClicked.call();
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
          // Expanded(
          //   flex: 1,
          //   child: Padding(
          //     padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
          //     child: FittedBox(
          //       fit: BoxFit.fitWidth,
          //       child: InkWell(
          //         splashColor: Colors.transparent,
          //         onTap: () async {
          //           widget.onForgotClicked.call();
          //         },
          //         child: Text(
          //           "Forgot Password?",
          //           style: TextStyle(
          //             // decoration: TextDecoration.underline,
          //             fontWeight: FontWeight.w800,
          //             color: Palette.darkBlue.withOpacity(0.8),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
