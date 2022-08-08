import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:sih_student_app/pages/auth/auth_screen.dart';
import 'package:sih_student_app/pages/homePage.dart';
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
            ref.read(userIdProvider.notifier).state =
                ref.read(authInst).currentUser!.uid;
            return const HomePage();
            // return FutureBuilder<DocumentSnapshot>(
            //     future: getUserData(ref),
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return Center(
            //           child: Lottie.asset(
            //             'assets/lottie/loadingLottie.json',
            //             fit: BoxFit.fill,
            //           ),
            //         );
            //       }
            //       // return AppDrawer();
            //       return ZoomDrawer(
            //         controller: ref.read(zoomController),
            //         menuScreen: const AppDrawer(),
            //         mainScreen: GestureDetector(
            //             onTap: () {
            //               ref.read(zoomController).close!();
            //             },
            //             child: DashBoard()),
            //         openCurve: Curves.elasticOut,
            //         closeCurve: Curves.elasticIn,
            //         duration: const Duration(milliseconds: 200),
            //         mainScreenScale: 0.4,
            //         borderRadius: MediaQuery.of(context).size.width / 10,
            //         showShadow: true,
            //         angle: -8,
            //         backgroundColor: maroonColor,
            //         slideWidth: MediaQuery.of(context).size.width * 0.32,
            //         shadowLayer1Color: Colors.grey.shade200,
            //         shadowLayer2Color: Colors.grey.shade300,
            //         boxShadow: [
            //           BoxShadow(
            //               color: Colors.grey.withOpacity(0.65),
            //               blurRadius: 20,
            //               offset: const Offset(-10, 10))
            //         ],
            //       );
            //     });
          } else {
            return const AuthScreen();
          }
        });
  }

  void _navigateToAuthScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Navigator.of(context).pushReplacement(AuthScreen.route),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Navigator.of(context).pushReplacement(HomePage.route),
    );
  }
}
