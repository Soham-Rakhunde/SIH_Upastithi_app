import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/auth/forgot_password.dart';
import 'package:sih_student_app/pages/auth/sign_in.dart';
import 'package:sih_student_app/services/Profile/background_painter.dart';
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
    Size size = MediaQuery.of(context).size;
    print(size);
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
              constraints: BoxConstraints(maxWidth: size.width * 0.95),
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
                          onForgotClicked: () {
                            ref.watch(authPageController.notifier).state =
                                authPages.reset_password;
                            _controller.reverse();
                          }),
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
