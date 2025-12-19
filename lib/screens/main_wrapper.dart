// lib/screens/main_wrapper.dart
import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/screens/dashboard/dashboard_screen.dart';
import 'package:jurnalku_mobile/screens/jurnal/jurnal_screen.dart';
import 'package:jurnalku_mobile/screens/explore/explore_screen.dart'; // baru
import 'package:jurnalku_mobile/screens/progress/progress_screen.dart';
import 'package:jurnalku_mobile/screens/profile/student_profile_page.dart';
import 'package:jurnalku_mobile/widgets/custom_bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({Key? key}) : super(key: key);
  @override State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const JurnalScreen(),
    const ExploreScreen(),        // BARU: Jelajahi
    const ProgressScreen(),
    const StudentProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}