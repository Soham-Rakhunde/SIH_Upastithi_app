import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sih_student_app/pages/splash_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:camera/camera.dart';
import 'package:sih_student_app/services/face_detect/page/face_recognition/camera_page.dart';
import 'package:sih_student_app/services/face_detect/page/login_page.dart';
import 'package:sih_student_app/services/face_detect/utils/local_db.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF1F2F6),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color(0xFFF1F2F6),
    ));
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'SIH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
        // fontFamily: "MontserratAlternates",
        // textTheme: GoogleFonts.montserratAlternatesTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
      // home: LoginPage()
      home: const SplashScreen(),
      // home: _MyHomePage(),
    );
  }
}