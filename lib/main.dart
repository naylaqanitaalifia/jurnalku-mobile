// main.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:jurnalku_mobile/providers/auth_provider.dart';
import 'package:jurnalku_mobile/screens/general/explore_students_direction.dart';
import 'package:jurnalku_mobile/screens/main_wrapper.dart';

import 'package:jurnalku_mobile/screens/profile/student_profile_page.dart'; // ← Ganti ini untuk tes langsung ke page lain

void main() {
  // runApp(const MyApp()); // ← Default

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      // home: const StudentProfilePage(), // ← custom route
    );
  }
}