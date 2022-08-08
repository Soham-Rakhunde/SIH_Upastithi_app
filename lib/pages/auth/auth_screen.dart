import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/forgot_password.dart';
import 'package:sih_student_app/pages/auth/register.dart';
import 'package:sih_student_app/pages/auth/sign_in.dart';
import 'package:sih_student_app/pages/auth/widgets/background_painter.dart';
import 'package:sih_student_app/services/providers.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const AuthScreen(),
      );

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _controller.value = 1;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: SizedBox.expand(
                child: PageTransitionSwitcher(
                    reverse: ref.watch(authPageController) != authPages.sign_in,
                    duration: const Duration(milliseconds: 800),
                    transitionBuilder: (child, animation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        fillColor: Colors.transparent,
                        child: child,
                      );
                    },
                    child: [
                      SignIn(
                        key: const ValueKey('SignIn'),
                        onRegisterClicked: () {
                          ref.watch(authPageController.notifier).state =
                              authPages.register;
                          _controller.reverse();
                        },
                        onForgotClicked: () {
                          ref.watch(authPageController.notifier).state =
                              authPages.reset_password;
                          _controller.reverse();
                        }
                      ),
                      Register(
                        key: const ValueKey('Register'),
                        onSignInPressed: () {
                          // context.resetSignInForm();
                          ref.watch(authPageController.notifier).state =
                              authPages.sign_in;
                          _controller.forward();
                        },
                      ),
                      ForgotPassword(
                        key: const ValueKey('ForgotPassword'),
                        onSignInPressed: () {
                          // context.resetSignInForm();
                          ref.watch(authPageController.notifier).state =
                              authPages.sign_in;
                          _controller.forward();
                        },
                      ),
                    ].elementAt(ref.watch(authPageController).index)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
