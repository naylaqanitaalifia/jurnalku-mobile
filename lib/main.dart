// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jurnalku_mobile/screens/general/explore_students_direction.dart';
import 'package:jurnalku_mobile/screens/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const StudentDirectory(), // ← tetap login dulu
      // home: const MainWrapper(), // ← uncomment kalau mau langsung ke dashboard (untuk testing)
    );
  }
}