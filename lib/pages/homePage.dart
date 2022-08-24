import 'dart:async';

import 'package:animations/animations.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/pages/bluetooth/bluetoothTab.dart';
import 'package:sih_student_app/pages/dashboardTab.dart';
import 'package:sih_student_app/pages/profileTab.dart';
import 'package:sih_student_app/pages/qrScannerTab.dart';
import 'package:sih_student_app/pages/scholarshipTab.dart';
import 'package:sih_student_app/services/colors.dart';
import 'package:sih_student_app/services/providers.dart';
class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
        builder: (context) => const HomePage(),
      );

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}


class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {

  List tabs = [
    DashboardTab(),
    ScholarshipTab(),
    QrScannerTab(),
    BluetoothTab(),
    ProfileTab(),
  ];

  void _handleIndexChanged(int i) {
    ref.watch(homeTabController.notifier).state = homeTabs.values[i];
  }


  late FlutterBluePlus  flutterBlueInstance;

  @override
  initState(){
    flutterBlueInstance = FlutterBluePlus.instance;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final selectedIndex = ref.watch(homeTabController).index;
    ref.listen(homeTabController, (homeTabs? previous, homeTabs next) {
      if (previous != null && next.index >= previous.index) {
        ref
            .watch(tabsDirection.notifier)
            .state = false;
      }
      else {
        ref
            .watch(tabsDirection.notifier)
            .state = true;
      }
      if (next.name == 'bluetooth') {
        flutterBlueInstance.startScan(scanMode: ScanMode.opportunistic,timeout: Duration(seconds: 120));
        var subscription = flutterBlueInstance.scanResults.listen((results) {
          // do something with scan results
          for (ScanResult r in results) {
            print('${r.device.name} found! rssi: ${r.rssi}');
          }
        });

      }
      else if (previous?.name == 'bluetooth') {
        flutterBlueInstance.stopScan();
      }
    });

    return Scaffold(
      // backgroundColor: homePageColors[ref.watch()],
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 1000),
        reverse: ref.watch(tabsDirection),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: tabs[selectedIndex],
      ),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: selectedIndex,
        marginR: EdgeInsets.symmetric(
            vertical: size.width * 0.05, horizontal: size.width * 0.06),
        itemPadding: EdgeInsets.symmetric(
            vertical: size.width * 0.04, horizontal: size.width * 0.05),
        dotIndicatorColor: Colors.transparent,
        borderRadius: size.width * 0.04,
        onTap: _handleIndexChanged,
        // boxShadow: (ref.watch(homeTabController).index %2 == 0)  ? boxShadow : [],
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.chartSimple),
            selectedColor: Colors.blue,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.graduationCap),
            selectedColor: Colors.pink,
          ),

          /// Search
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.qrcode),
            selectedColor: Colors.orange,
          ),
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.bluetooth),
            selectedColor: Colors.purple,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.user),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
