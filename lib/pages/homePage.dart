import 'package:animations/animations.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sih_student_app/pages/dashboardTab.dart';
import 'package:sih_student_app/pages/profileTab.dart';
import 'package:sih_student_app/pages/qrScannerTab.dart';
import 'package:sih_student_app/services/colors.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static MaterialPageRoute get route => MaterialPageRoute(
    builder: (context) => const HomePage(),
  );

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

enum _SelectedTab { home, favorite, search, person }

class _HomePageState extends ConsumerState<HomePage>
    with SingleTickerProviderStateMixin {
  var _selectedTab = _SelectedTab.home;

  List tabs = [
    DashboardTab(),
    Container(
      color: Colors.blue,
    ),
    QrScannerTab(),
    ProfileTab(),
  ];

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 1000),
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.scaled,
            child: child,
          );
        },
        child: tabs[_SelectedTab.values.indexOf(_selectedTab)],
      ),
      extendBody: true,
      bottomNavigationBar: DotNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        marginR: EdgeInsets.symmetric(vertical: size.width*0.05, horizontal: size.width*0.08),
        itemPadding: EdgeInsets.symmetric(vertical: size.width*0.04, horizontal: size.width*0.06),
        dotIndicatorColor: Colors.transparent,
        borderRadius: 20,
        onTap: _handleIndexChanged,
        boxShadow: boxShadow,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const FaIcon(FontAwesomeIcons.chartLine),
            selectedColor: Colors.purple,
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
