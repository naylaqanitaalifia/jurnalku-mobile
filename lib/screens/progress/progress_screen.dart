// lib/screens/progress/progress_screen.dart
import 'package:flutter/material.dart';
import 'package:jurnalku_mobile/widgets/app_navbar.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppNavbar(
            name: "M.Reysha Nova Arshandy",
            kelas: "PPLG XII-5",
            photoUrl: "https://jurnalku.smkwikrama.sch.id/storage/jurnalku/photo_profile/student/12309727_1733272448.jpg",
          ),
          const Expanded(
            child: Center(
              child: Text("Progress Kompetensi\nComing Soon!", style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }
}