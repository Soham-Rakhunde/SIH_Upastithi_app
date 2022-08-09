import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/widgets/decoration_functions.dart';
import 'package:sih_student_app/pages/auth/widgets/sign_in_up_bar.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class ForgotPassword extends ConsumerStatefulWidget {
  ForgotPassword({Key? key, required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  ConsumerState<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPassword> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final isSubmitting = context.isSubmitting();
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        widget.onSignInPressed.call();
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
            const Spacer(
              flex: 2,
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
                            fontWeight: FontWeight.w700),
                        decoration:
                            registerInputDecoration(hintText: 'Enter Email')),
                  ),
                  SignUpBar(
                    label: 'Send',
                    isLoading: true,
                    // isLoading: isSubmitting,
                    onPressed: () async {
                      final email = _emailController.text.trim();
                      ref.watch(authController.notifier).changePassword(
                          email, widget.onSignInPressed, ref, context);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    onTap: () async {
                      widget.onSignInPressed.call();
                    },
                    child: const Text(
                      "Password changed already? Log in",
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
