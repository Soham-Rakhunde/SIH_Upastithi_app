import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_student_app/pages/auth/auth_screen.dart';
import 'package:sih_student_app/pages/homePage.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Future<DocumentSnapshot> getUserData(WidgetRef ref) async {
    //   DocumentSnapshot docs =
    //   await ref.read(usersCollection).doc(ref.read(userIdProvider)).get();
    //   ref.read(nameProvider.notifier).state = docs.get('name');
    //   ref.read(roleProvider.notifier).state = docs.get('role');
    //   ref.read(yearProvider.notifier).state = docs.get('year');
    //   List<String> topic = ["FE", "SE", "TE", "BE"];
    //   ref.read(fcmInst).subscribeToTopic(topic[docs.get('year') - 1]);
    //   if (docs.get('role') == "admin") {
    //     final String? token = await ref.read(fcmInst).getToken();
    //     ref.read(fcmInst).subscribeToTopic(token!);
    //   }
    //   return docs;
    // }
    //

    return StreamBuilder<User?>(
        stream: ref.read(authInst).authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset(
                'assets/lottie/loadingLottie.json',
                fit: BoxFit.fill,
              ),
            );
          }
          if (snapshot.hasData) {
            String uuid = ref.read(authInst).currentUser!.uid;
            return FutureBuilder<void>(
                future: ref.read(userController.notifier).getUserData(uuid, context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: dashColor,
                      child: Center(
                        child: Lottie.asset(
                          'assets/lottie/loadingLottie.json',
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }
                  return const HomePage();
                });
          } else {
            return const AuthScreen();
          }
        });
  }
}
